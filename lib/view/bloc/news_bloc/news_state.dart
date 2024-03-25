part of 'news_bloc.dart';

enum NewsStatus { initial, loading, loaded, error }

class NewsState {
  const NewsState({
    this.status = NewsStatus.initial,
    this.newsList = const <News>[],
    this.hasReachedMax = false,
  });

  final NewsStatus status;
  final List<News> newsList;
  final bool hasReachedMax;
  // final NewsStatus isLoading = NewsStatus.loading;

  NewsState copyWith({
    NewsStatus? status,
    List<News>? newsList,
    bool? hasReachedMax,
  }) {
    return NewsState(
      status: status ?? this.status,
      newsList: newsList ?? this.newsList,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}