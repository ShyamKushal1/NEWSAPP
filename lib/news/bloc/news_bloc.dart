import 'dart:async';
import 'dart:core';

import 'package:bloc/bloc.dart';

import 'package:news_app/news/models/models.dart';
import 'package:news_app/news/repository/news_repository.dart';
import 'package:rxdart/rxdart.dart';

import 'bloc.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository _newsRepository;
  NewsBloc(NewsRepository newsRepository)
      : assert (newsRepository !=null ),
        _newsRepository = newsRepository,
        super(const NewsState());

  @override
  Stream<Transition<NewsEvent, NewsState>> transformEvents(
    Stream<NewsEvent> events,
    TransitionFunction<NewsEvent, NewsState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 10000)),
      transitionFn,
    );
  }

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is NewsFetched) {
      yield await _mapPostFetchedToState(state);
    }
    if (event is SearchNews){
     yield* _updateSearchResults(state, event.query);
    }
    if (event is ClearQuery){
      yield state.updateNewsState(hasReachedMax: event.reachedMax);
      yield await _mapPostFetchedToState(state);
    }
  }

  /* This method call the limit value and saves the fetched records**/
  Future<NewsState> _mapPostFetchedToState(NewsState state) async {
    if (state.hasReachedMax) return state;
    try {
      if (state.status == NewsStatus.initial ) {
        final news = await _newsRepository.getNews(0, 20);
        return state.updateNewsState(
          status: NewsStatus.success,
          news: news,
          hasReachedMax: false,
        );
      }
      final news = await _newsRepository.getNews(state.news.length, 20);

      return news.isEmpty
          ? state.updateNewsState(hasReachedMax: true)
          : state.updateNewsState(
              status: NewsStatus.success,
              news: (List.of(state.news)..addAll(news)),
              hasReachedMax: false,
            );
    } on Exception {
      return state.updateNewsState(status: NewsStatus.failure);
    }
  }

  /* This method update search query and filter the record in the listview**/
  Stream<NewsState> _updateSearchResults(NewsState state, String searchQuery) async* {
    if(searchQuery.isNotEmpty) {
      List<NewsModel> searchList = List<NewsModel>();
      state.news.forEach((element) {
        if (element.sourceModel.name.contains(searchQuery)) {
          searchList.add(element);
        }
      });
      yield state.updateNewsState(
          status: state.status,
          news: searchList,
          hasReachedMax: true
      );
    }
  }


}
