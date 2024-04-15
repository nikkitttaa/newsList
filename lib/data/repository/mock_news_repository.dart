import 'package:news_list/domain/model/news_model.dart';
import 'package:news_list/domain/repository/news_repository.dart';

class MockNewsRepository implements NewsRepository {
  @override
  Future<List<News>> fetchNews({required int limit, required int offset}) async {
    return [
      const News(id: 1, title: 'title', imageUrl: 'title', summary: 'title', siteUrl: '1232'),
      const News(id: 2, title: 'title', imageUrl: 'title', summary: 'title', siteUrl: '1232'),
      const News(id: 3, title: 'title', imageUrl: 'title', summary: 'title', siteUrl: '1232'),
      const News(id: 4, title: 'title', imageUrl: 'title', summary: 'title', siteUrl: '1232'),
      const News(id: 5, title: 'title', imageUrl: 'title', summary: 'title', siteUrl: '1232'),
      const News(id: 6, title: 'title', imageUrl: 'title', summary: 'title', siteUrl: '1232'),
      const News(id: 7, title: 'title', imageUrl: 'title', summary: 'title', siteUrl: '1232'),
      const News(id: 8, title: 'title', imageUrl: 'title', summary: 'title', siteUrl: '1232'),
      const News(id: 9, title: 'title', imageUrl: 'title', summary: 'title', siteUrl: '1232'),
      const News(id: 10, title: 'title', imageUrl: 'title', summary: 'title', siteUrl: '1232'),
    ];
  }

  @override
  Future<News> fetchNewsById({required int id}) {
    // TODO: implement fetchNewsById
    throw UnimplementedError();
  }

  @override
  Future<List<News>> searchNewsByName({required String title, required int limit, required int offset}) {
    // TODO: implement searchNewsByName
    throw UnimplementedError();
  }
}
