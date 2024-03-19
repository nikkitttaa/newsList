import 'dart:convert';
import 'package:http/http.dart' as http;

class News {
  final int id;
  final String title;
  final String siteUrl;
  final String imageUrl;
  final String summary;
  final String publishedAt;

  News(
      {required this.id,
      required this.title,
      required this.siteUrl,
      required this.imageUrl,
      required this.summary,
      required this.publishedAt});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'],
      title: json['title'],
      siteUrl: json['url'],
      imageUrl: json['image_url'],
      summary: json['summary'],
      publishedAt: json['published_at'],
    );
  }

  static Future<List<News>> fetchNews() async {
    var url =
        'https://api.spaceflightnewsapi.net/v4/articles/?launch=65896761-b6ca-4df3-9699-e077a360c52a';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final responseList =
          json.decode(response.body)['results'] as List<dynamic>;

      return responseList
          .map((e) => News.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Error');
    }
  }

  static Future<News> fetchNewsById(int id) async {
    var url =
        'https://api.spaceflightnewsapi.net/v4/articles/?launch=65896761-b6ca-4df3-9699-e077a360c52a';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final responseList =
          json.decode(response.body)['results'] as List<dynamic>;

      var news = responseList
          .map((e) => News.fromJson(e as Map<String, dynamic>))
          .toList();

      News selectedNews =
          news.where((element) => element.id == id).toList().first;

      return selectedNews;
    } else {
      throw Exception('Error');
    }
  }
}
