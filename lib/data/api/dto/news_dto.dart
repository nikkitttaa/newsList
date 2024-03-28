class NewsDto{
  final int id;
  final String title;
  final String siteUrl;
  final String imageUrl;
  final String summary;
  final String publishedAt;

  NewsDto.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        siteUrl = json['url'],
        imageUrl = json['image_url'],
        summary = json['summary'],
        publishedAt = json['published_at'];
}
