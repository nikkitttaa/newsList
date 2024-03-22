part of 'full_news_bloc.dart';

abstract class FullNewsState {}

final class FullNewsInitial extends FullNewsState {}

final class FullNewsLoading extends FullNewsState {}

final class FullNewsLoaded extends FullNewsState {
  final News newsById;

  FullNewsLoaded(this.newsById);
}

final class FullNewsError extends FullNewsState {}