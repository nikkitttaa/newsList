import 'package:flutter/material.dart';
import 'package:news_list/generated/l10n.dart';
import 'package:news_list/presentation/components/news_tile.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //txt
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.35,
                vertical: 10,
              ),
              child: Text(
                AppLocalization.of(context).allNews,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            //list
            const Expanded(child: NewsTile())
          ],
        ),
      ),
    );
  }
}
