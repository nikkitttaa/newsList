import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_list/internal/dependencies/resource/app_constant.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final GetIt locator = GetIt.instance;

final Dio dio = Dio(BaseOptions(
  baseUrl: Constant.url,
))
  ..interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
  ));
