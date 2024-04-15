import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_list/presentation/screen/full_news_screen.dart';
import 'package:news_list/presentation/screen/news_list_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: NewsListRoute.page, path: '/'),
    AutoRoute(page: FullNewsRoute.page),
  ];
}