import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list/data/api/services/news_services.dart';
import 'package:news_list/data/repository/data_news_repository.dart';
import 'package:news_list/domain/model/news_model.dart';
import 'package:news_list/domain/repository/news_repository.dart';

part 'full_news_event.dart';

part 'full_news_state.dart';

class FullNewsBloc extends Bloc<FullNewsEvent, FullNewsState> {
  FullNewsBloc() : super(FullNewsInitial()) {
    on<FetchNewsByIdEvent>(_fetchNewsById);
  }

  final NewsRepository repository = DataNewsRepository(
    service: NewsServices(),
  );

  FutureOr<void> _fetchNewsById(
    FetchNewsByIdEvent event,
    Emitter<FullNewsState> emit,
  ) async {
      emit(FullNewsLoading());

      final newsById = await repository.fetchNewsById(id: event.id);

      emit(FullNewsLoaded(newsById));

  }
}
