

import 'package:news_list/domain/model/news_model.dart';
import 'package:news_list/domain/repository/news_repository.dart';

class MockNewsRepository implements NewsRepository {
  @override
  Future<List<News>> fetchNews({required int limit, required int offset}) async {
    return [
      News(id: 1, title: 'title', imageUrl: 'title', summary: 'title', siteUrl: '1232'),
      News(id: 1, title: 'title', imageUrl: 'title', summary: 'title', siteUrl: '1232'),
      News(id: 1, title: 'title', imageUrl: 'title', summary: 'title', siteUrl: '1232'),
      News(id: 1, title: 'title', imageUrl: 'title', summary: 'title', siteUrl: '1232'),
      News(id: 1, title: 'title', imageUrl: 'title', summary: 'title', siteUrl: '1232'),
      News(id: 1, title: 'title', imageUrl: 'title', summary: 'title', siteUrl: '1232'),
      News(id: 1, title: 'title', imageUrl: 'title', summary: 'title', siteUrl: '1232'),
      News(id: 1, title: 'title', imageUrl: 'title', summary: 'title', siteUrl: '1232'),
      News(id: 1, title: 'title', imageUrl: 'title', summary: 'title', siteUrl: '1232'),
      News(id: 1, title: 'title', imageUrl: 'title', summary: 'title', siteUrl: '1232'),
    ];
  }

  @override
  Future<News> fetchNewsById({required int id}) {
    // TODO: implement fetchNewsById
    throw UnimplementedError();
  }

}