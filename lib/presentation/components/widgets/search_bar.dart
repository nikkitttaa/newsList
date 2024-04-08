import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_list/data/api/services/news_services.dart';
import 'package:news_list/generated/l10n.dart';
import 'package:news_list/injection/di.dart';

class SearchNewsBar extends StatefulWidget {
  const SearchNewsBar({super.key});

  @override
  State<SearchNewsBar> createState() => _SearchNewsBarState();
}

class _SearchNewsBarState extends State<SearchNewsBar> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    searchController;
    super.initState();
  }

  @override
  void dispose() {
    searchController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.05,
        vertical: MediaQuery.sizeOf(context).height * 0.015,
      ),
      child: CupertinoSearchTextField(
        controller: searchController,
        onTap: () {
          if (searchController.text != '') {
            newsServices.searchNewsByName(title: searchController.text);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(AppLocalization.of(context).searchErrorNull),
              ),
            );
          }
        },
      ),
    );
  }

  final NewsServices newsServices = NewsServices(dio: locator());
}
