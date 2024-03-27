import 'package:flutter/material.dart';
import 'package:news_list/internal/dependencies/resource/app_colors.dart';

class AppThemeData {
  static final ThemeData mainTheme = ThemeData(fontFamily: 'Poppins');

  static const TextStyle summaryStyle = TextStyle(
    fontSize: 16,
    color: AppColor.summaryColor,
  );

  static const TextStyle titleForNewsListStyle = TextStyle(
    fontSize: 18,
  );

  static const TextStyle titleForFullNewsStyle = TextStyle(
    fontSize: 24,
  );

  static const TextStyle linkBtnStyle = TextStyle(
    fontSize: 16,
  );
}
