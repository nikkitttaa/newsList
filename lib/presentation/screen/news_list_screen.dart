import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_list/generated/l10n.dart';
import 'package:news_list/presentation/components/news_tile.dart';
import 'package:news_list/presentation/components/widgets/search_bar.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(AppLocalization.of(context).allNews),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.sizeOf(context).height * 0.06),
          child: const SearchNewsBar(),
        ),
      ),
      body: const NewsTile(),
    );
  }
}
