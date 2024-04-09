import 'package:json_annotation/json_annotation.dart';

part 'news_dto.g.dart';

@JsonSerializable()
class NewsDto {
  final int id;
  final String title;
  @JsonKey(name: 'url')
  final String siteUrl;
  @JsonKey(name: 'image_url')
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
}
