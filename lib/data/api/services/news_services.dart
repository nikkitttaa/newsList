import 'package:news_list/data/api/dto/news_dto.dart';
import 'package:dio/dio.dart';

class NewsServices {
  NewsServices({required this.dio});

  final Dio dio;

  Future<List<NewsDto>> fetchNews({required int limit, required int offset}) async {
    final Response response = await dio.get(
      '/articles/',
      queryParameters: {
        'launch': '65896761-b6ca-4df3-9699-e077a360c52a',
        'limit': limit,
        'offset': offset,
      },
    );

    if (response.statusCode == 200) {
      final responseList = response.data['results'] as List<dynamic>;

      return responseList.map((response) => NewsDto.fromJson(response as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Error');
    }
  }

  Future<NewsDto> fetchNewsById({required int id}) async {
    final Response response = await dio.get('/articles/$id/');
    if (response.statusCode == 200) {
      final responseList = response.data as Map<String, dynamic>;

      var news = NewsDto.fromJson(responseList);

      return news;
    } else {
      throw Exception('Error');
    }
  }

  Future<NewsDto> searchNewsByName({required String title}) async {
    final Response response = await dio.get(
      '/articles/',
      queryParameters: {
        'launch': '65896761-b6ca-4df3-9699-e077a360c52a',
        'search': title,
      },
    );
    if (response.statusCode == 200) {
      final responseList = response.data as Map<String, dynamic>;

      var news = NewsDto.fromJson(responseList);

      return news;

    } else {
      throw Exception('Error');
    }
  }
}
