part of 'full_news_bloc.dart';

abstract class FullNewsEvent {}

class FetchNewsByIdEvent extends FullNewsEvent {
  final int id;

  FetchNewsByIdEvent({required this.id});
}
