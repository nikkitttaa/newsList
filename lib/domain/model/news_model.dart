class News {
  final int id;
  final String title;
  final String siteUrl;
  final String imageUrl;
  final String summary;
  final String publishedAt;

  News({
    required this.id,
    required this.title,
    required this.siteUrl,
    required this.imageUrl,
    required this.summary,
    required this.publishedAt,
  });

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
}
