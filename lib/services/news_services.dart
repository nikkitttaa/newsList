import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_list/model/news_model.dart';
import 'package:news_list/resource/app_constant.dart';

class NewsServices {
  static Future<List<News>> fetchNews({required int limit, required int offset}) async {
    var url =
        '${Constant.url}?launch=65896761-b6ca-4df3-9699-e077a360c52a&limit=$limit&offset=$offset';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final responseList = json.decode(response.body)['results'] as List<dynamic>;

      function(response) {
        return News.fromJson(response as Map<String, dynamic>);
      }

      return responseList.map(function).toList();
    } else {
      throw Exception('Error');
    }
  }

  static Future<News> fetchNewsById({required int id}) async {
    final response = await http.get(Uri.parse('${Constant.url}$id/'));
    if (response.statusCode == 200) {
      final responseList = json.decode(response.body) as Map<String, dynamic>;

      var news = News.fromJson(responseList);

      return news;
    } else {
      throw Exception('Error');
    }
  }
}
