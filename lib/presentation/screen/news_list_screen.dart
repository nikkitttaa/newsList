import 'package:flutter/material.dart';
import 'package:news_list/generated/l10n.dart';
import 'package:news_list/presentation/components/news_screen.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(AppLocalization.of(context).allNews),
      ),
      body: const NewsScreen(),
    );
  }
}
