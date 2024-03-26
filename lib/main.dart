import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_list/resource/app_theme.dart';
import 'package:news_list/view/screen/news_list_screen.dart';
import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const NewsListScreen(),
    );
  }
}
