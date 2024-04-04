import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:news_list/data/api/services/news_services.dart';
import 'package:news_list/data/repository/data_news_repository.dart';
import 'package:news_list/data/repository/mock_news_repository.dart';
import 'package:news_list/domain/repository/news_repository.dart';
import 'package:news_list/internal/dependencies/resource/app_theme.dart';
import 'package:news_list/presentation/screen/news_list_screen.dart';
import 'generated/l10n.dart';

void main() {
  GetIt locator = GetIt.instance;

  runApp(MyApp(locator: locator));

  locator.registerLazySingleton<NewsRepository>(() => DataNewsRepository(service: NewsServices()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.locator});

  final GetIt locator;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: AppLocalization.delegate.supportedLocales.first,
      theme: AppThemeData.mainTheme,
      debugShowCheckedModeBanner: false,
      home: NewsListScreen(locator: locator),
    );
  }
}
