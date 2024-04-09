import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_list/data/api/services/news_services.dart';
import 'package:news_list/data/repository/data_news_repository.dart';
import 'package:news_list/domain/repository/news_repository.dart';
import 'package:news_list/resource/app_constant.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final GetIt locator = GetIt.instance;

Future<void> initializeDependencies() async {
  locator.registerLazySingleton(
        () =>
    Dio(
      BaseOptions(
        baseUrl: Constant.url,
      ),
    )
      ..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
        ),
      ),
  );

  locator.registerLazySingleton<NewsRepository>(() => DataNewsRepository(service: NewsServices(dio: locator(),)));
}

