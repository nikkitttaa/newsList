import 'dart:convert';
import 'package:http/http.dart' as http;

class News {
  final String title;
  final String imageUrl;
  final String summary;
  final String publishedAt;

  News(
      {required this.title,
      required this.imageUrl,
      required this.summary,
      required this.publishedAt});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'],
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
}
