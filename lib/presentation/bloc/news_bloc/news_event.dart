part of 'news_bloc.dart';

abstract class NewsEvent {}

class FetchNewsEvent extends NewsEvent {}

class SearchNewsByName extends NewsEvent {}
