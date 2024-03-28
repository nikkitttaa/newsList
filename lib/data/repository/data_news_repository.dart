import 'dart:async';
import 'package:news_list/data/api/services/news_services.dart';
import 'package:news_list/domain/model/news_model.dart';
import 'package:news_list/domain/repository/news_repository.dart';

class DataNewsRepository implements NewsRepository {
  final NewsServices service;

  DataNewsRepository({required this.service});

  @override
  Future<List<News>> fetchNews({required int limit, required int offset}) async {
    final newsList = await service.fetchNews(limit: limit, offset: offset);

    return newsList.map<News>((e) {
      return News(
        id: e.id,
        title: e.title,
        imageUrl: e.imageUrl,
        summary: e.summary,
        siteUrl: e.siteUrl,
      );
    }).toList();
  }

  @override
  Future<News> fetchNewsById({required int id}) async {
    final news = await service.fetchNewsById(id: id);

    return News(
      id: news.id,
      title: news.title,
      summary: news.summary,
      imageUrl: news.imageUrl,
      siteUrl: news.siteUrl,
    );
  }
}
