import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list/domain/model/news_model.dart';
import 'package:news_list/domain/repository/news_repository.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({required this.newsRepository}) : super(NewsState()) {
    on<FetchNewsEvent>(_fetchNews);
  }

  final NewsRepository newsRepository;


  FutureOr<void> _fetchNews(FetchNewsEvent event,
      Emitter<NewsState> emit,) async {
    try {
      var currentPage = 0;

      currentPage = state.newsList.length ~/ 10;

      emit(
        state.copyWith(
          isFirstLoad: currentPage == 0,
          status: NewsStatus.loading,
        ),
      );

      final news = await newsRepository.fetchNews(limit: 10, offset: currentPage * 10);

      emit(
        state.copyWith(
          status: NewsStatus.loaded,
          newsList: [
            ...state.newsList,
            ...news,
          ],
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: NewsStatus.error));
    }
  }
}