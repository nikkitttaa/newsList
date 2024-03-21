import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/news_model.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<FetchNewsEvent>(_fetchNews);
  }

  _fetchNews(event, emit) {
    NewsLoading();

    News.fetchNews().then((newsList) {
      emit(NewsLoaded.new);
    }).catchError((error) {
      emit(NewsError());
    });
  }
}
