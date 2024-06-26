import 'dart:async';
import 'package:news_list/data/api/services/api.dart';
import 'package:news_list/domain/model/news_model.dart';
import 'package:news_list/domain/repository/news_repository.dart';

class DataNewsRepository implements NewsRepository {
  final ApiServices service;

  DataNewsRepository({required this.service});

  @override
  Future<List<News>> fetchNews({required int limit, required int offset}) async {
    final paginationWrapper = await service.fetchNews(limit: limit, offset: offset);

    final newsList = paginationWrapper.result.map<News>((e) {
      return News(
        id: e.id,
        title: e.title,
        imageUrl: e.imageUrl,
        summary: e.summary,
        siteUrl: e.siteUrl,
      );
    }).toList();

    return newsList;
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

  @override
  Future<List<News>> searchNewsByName({required String title, required int limit, required int offset}) async {
    final paginationWrapper = await service.searchNewsByName(title: title, limit: limit, offset: offset);

    final newsList = paginationWrapper.result.map<News>((e) {
      return News(
        id: e.id,
        title: e.title,
        imageUrl: e.imageUrl,
        summary: e.summary,
        siteUrl: e.siteUrl,
      );
    }).toList();

    return newsList;
  }
}
