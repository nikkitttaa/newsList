import 'package:news_list/domain/model/news_model.dart';

abstract class NewsRepository {
  Future<List<News>> fetchNews({required int limit, required int offset});

  Future<News> fetchNewsById({required int id});

  Future<List<News>> searchNewsByName({required String title});
}
