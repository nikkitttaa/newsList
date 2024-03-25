import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list/model/news_model.dart';
import 'package:news_list/services/news_services.dart';

part 'full_news_event.dart';

part 'full_news_state.dart';

class FullNewsBloc extends Bloc<FullNewsEvent, FullNewsState> {
  FullNewsBloc(this.id) : super(FullNewsInitial()) {
    on<FetchNewsByIdEvent>(_fetchNewsById);
  }

  final int id;

  FutureOr<void> _fetchNewsById(
    FetchNewsByIdEvent event,
    Emitter<FullNewsState> emit,
  ) async {
    try {
      emit(FullNewsLoading());

      final newsById = await NewsServices.fetchNewsById(id: id);

      emit(FullNewsLoaded(newsById));
    }catch (_) {
      emit(FullNewsError());
    }
  }
}
