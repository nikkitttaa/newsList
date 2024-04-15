import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_model.freezed.dart';

@freezed
class News with _$News {
  const factory News({
    required int id,
    required String title,
    required String imageUrl,
    required String summary,
    required String siteUrl,
  }) = _News;
}
