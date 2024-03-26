import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list/model/news_model.dart';
import 'package:news_list/services/news_services.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsState()) {
    on<FetchNewsEvent>(_fetchNews);
  }

  FutureOr<void> _fetchNews(
    FetchNewsEvent event,
    Emitter<NewsState> emit,
  ) async {
    try {
      var currentPage = 0;

      currentPage = state.newsList.length ~/ 10;

      if (state.isFirstLoad == true) {
        emit(state.copyWith(status: NewsStatus.loading)); //не надежно. добавить bool первая или нет
      }

      final news = await NewsServices.fetchNews(limit: 10, offset: currentPage * 10);

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
