import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list/presentation/bloc/news_bloc/news_bloc.dart';


class SearchNewsBar extends StatefulWidget {
  const SearchNewsBar({super.key, required this.searchController});

  final TextEditingController searchController;

  @override
  State<SearchNewsBar> createState() => _SearchNewsBarState();
}

class _SearchNewsBarState extends State<SearchNewsBar> {
  Timer? debounce;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.05,
        vertical: MediaQuery.sizeOf(context).height * 0.015,
      ),
      child: CupertinoSearchTextField(
        controller: widget.searchController,
        onSuffixTap: () {
          widget.searchController.text = '';
          context.read<NewsBloc>().add(FetchNewsEvent());
        },
        onChanged: (value) {
          if (value.length >= 3) {
            if (debounce?.isActive ?? false) debounce?.cancel();
            debounce = Timer(
              const Duration(milliseconds: 300),
              () {
                context.read<NewsBloc>().add(SearchNewsByName(title: widget.searchController.text));
              },
            );
          } else {
            context.read<NewsBloc>().add(FetchNewsEvent());
          }
        },
      ),
    );
  }
}
