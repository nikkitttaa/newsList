// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsDto _$NewsDtoFromJson(Map<String, dynamic> json) => NewsDto(
      id: json['id'] as int,
      title: json['title'] as String,
      siteUrl: json['url'] as String,
      imageUrl: json['image_url'] as String,
      summary: json['summary'] as String,
    );

Map<String, dynamic> _$NewsDtoToJson(NewsDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.siteUrl,
      'image_url': instance.imageUrl,
      'summary': instance.summary,
    };
