
import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NewsFetched extends NewsEvent {}

class SearchNews extends NewsEvent {
  final String query;

  SearchNews(this.query);

  @override
  List<Object> get props => [];

}

class ClearQuery extends NewsEvent{
  final bool reachedMax;

  ClearQuery(this.reachedMax);

  @override
  List<Object> get props => [];

}