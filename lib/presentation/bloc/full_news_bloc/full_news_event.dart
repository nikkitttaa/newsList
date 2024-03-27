part of 'full_news_bloc.dart';

abstract class FullNewsEvent {}

class FetchNewsByIdEvent extends FullNewsEvent {
  FetchNewsByIdEvent(this.id);

  final int id;
}
