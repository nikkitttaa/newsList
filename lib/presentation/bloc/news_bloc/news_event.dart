part of 'news_bloc.dart';

abstract class NewsEvent {}

class FetchNewsEvent extends NewsEvent {}

class SearchNewsByName extends NewsEvent {
  final String title;

  SearchNewsByName({required this.title});
}

class PaginationSearchNews extends NewsEvent {
  final String title;

  PaginationSearchNews({required this.title});
}
