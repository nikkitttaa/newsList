import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list/domain/model/news_model.dart';
import 'package:news_list/domain/repository/news_repository.dart';

part 'full_news_event.dart';

part 'full_news_state.dart';

class FullNewsBloc extends Bloc<FullNewsEvent, FullNewsState> {

  FullNewsBloc({required this.newsRepository}) : super(FullNewsInitial()) {
    on<FetchNewsByIdEvent>(_fetchNewsById);
  }

  final NewsRepository newsRepository;

  FutureOr<void> _fetchNewsById(
    FetchNewsByIdEvent event,
    Emitter<FullNewsState> emit,
  ) async {
    emit(FullNewsLoading());

    final newsById = await newsRepository.fetchNewsById(id: event.id);

    emit(FullNewsLoaded(newsById));
  }
}
