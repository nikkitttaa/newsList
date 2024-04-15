import 'package:dio/dio.dart';
import 'package:news_list/core/resource/app_constant.dart';
import 'package:news_list/data/api/dto/news_dto.dart';
import 'package:retrofit/http.dart';

part 'api.g.dart';

@RestApi(baseUrl: Constant.url)
abstract class ApiServices {
  factory ApiServices(Dio dio) = _ApiServices;



  @GET('/articles/?launch=65896761-b6ca-4df3-9699-e077a360c52a')
  Future<List<NewsDto>> fetchNews({
    @Query('limit') required int limit,
    @Query('offset') required int offset,
  });

  @GET('/articles/')
  Future<NewsDto> fetchNewsById({
    @Query('id') required int id,
  });

  @GET('/articles/?launch=65896761-b6ca-4df3-9699-e077a360c52a')
  Future<List<NewsDto>> searchNewsByName({
    @Query('limit') required int limit,
    @Query('offset') required int offset,
    @Query('search') required String title,
  });
}
