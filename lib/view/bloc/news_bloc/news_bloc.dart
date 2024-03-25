import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/news_model.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(const NewsState()) {
    on<FetchNewsEvent>(_fetchNews);
  }

  FutureOr<void> _fetchNews(
    FetchNewsEvent event,
    Emitter<NewsState> emit,
  ) async {
    try {
      var currentPage = 0;

      currentPage = state.newsList.length ~/ 10;

      if (currentPage == 0) {
        emit(state.copyWith(status: NewsStatus.loading));
      }

      final news = await News.fetchNews(limit: 10, offset: currentPage * 10);

      emit(
        state.copyWith(
          status: NewsStatus.loaded,
          newsList: [...state.newsList, ...news],
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: NewsStatus.error));
    }
  }
}
