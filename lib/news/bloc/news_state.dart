
import 'package:equatable/equatable.dart';
import 'package:news_app/news/models/news_model.dart';

enum NewsStatus { initial, success, failure }

class NewsState extends Equatable {
  const NewsState({
    this.status = NewsStatus.initial,
    this.news = const <NewsModel>[],
    this.hasReachedMax = false,
  });

  final NewsStatus status;
  final List<NewsModel> news;
  final bool hasReachedMax;

  NewsState updateNewsState({
    NewsStatus status,
    List<NewsModel> news,
    bool hasReachedMax,
  }) {
    return NewsState(
      status: status ?? this.status,
      news: news ?? this.news,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [status, news, hasReachedMax];
}
