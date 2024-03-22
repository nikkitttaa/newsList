import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/news_model.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<FetchNewsEvent>(_fetchNews);
  }

  FutureOr<void> _fetchNews(
    FetchNewsEvent event,
    Emitter<NewsState> emit,
  ) async {
    try {
      emit(NewsLoading());

      final news = await News.fetchNews();

      emit(NewsLoaded(news));
    } catch (_) {
      emit(NewsError());
    }
  }
}
