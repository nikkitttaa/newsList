part of 'news_bloc.dart';

enum NewsStatus { initial, loading, loaded, error }

class NewsState {
  NewsState({
    this.status = NewsStatus.initial,
    this.newsList = const <News>[],
    this.hasReachedMax = false,
    this.isFirstLoad = true,
  });

  final NewsStatus status;
  final List<News> newsList;
  final bool hasReachedMax;
  bool isFirstLoad;

  NewsState copyWith({
    NewsStatus? status,
    List<News>? newsList,
    bool? hasReachedMax,
    bool? isFirstLoad,
  }) {
    return NewsState(
      status: status ?? this.status,
      newsList: newsList ?? this.newsList,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isFirstLoad: isFirstLoad ?? this.isFirstLoad,
    );
  }
}
