import 'package:dio/dio.dart';
import 'package:news_list/core/resource/app_constant.dart';
import 'package:news_list/data/api/dto/news_dto.dart';
import 'package:retrofit/http.dart';

part 'api.g.dart';

@RestApi(baseUrl: Constant.url)
abstract class ApiServices {
  factory ApiServices(Dio dio) = _ApiServices;

  @GET('/articles/?launch=65896761-b6ca-4df3-9699-e077a360c52a')
  Future<PaginationWrapper<NewsDto>> fetchNews({
    @Query('limit') required int limit,
    @Query('offset') required int offset,
  });

  @GET('/articles/{id}')
  Future<NewsDto> fetchNewsById({
    @Path('id') required int id,
  });

  @GET('/articles/?launch=65896761-b6ca-4df3-9699-e077a360c52a')
  Future<PaginationWrapper<NewsDto>> searchNewsByName({
    @Query('limit') required int limit,
    @Query('offset') required int offset,
    @Query('search') required String title,
  });
}

class PaginationWrapper<T> {
  final List<T> result;

  PaginationWrapper({required this.result});

  factory PaginationWrapper.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJson) {
    return PaginationWrapper(
      result: (json['results'] as List<dynamic>).map((item) => fromJson(item)).toList(),
    );
  }
}
