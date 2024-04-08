import 'package:json_annotation/json_annotation.dart';

part 'news_dto.g.dart';

@JsonSerializable()
class NewsDto {
  final int id;
  final String title;
  final String siteUrl;
  final String imageUrl;
  final String summary;

  NewsDto({
    required this.id,
    required this.title,
    required this.siteUrl,
    required this.imageUrl,
    required this.summary,
  });

  factory NewsDto.fromJson(Map<String, dynamic> json) => _$NewsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NewsDtoToJson(this);

  // NewsDto.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       title  =json['title'],
  //       siteUrl = json['url'],
  //       imageUrl = json['image_url'],
  //       summary = json['summary'];
}
