import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list/presentation/bloc/news_bloc/news_bloc.dart';
import 'package:news_list/resource/debounce.dart';

class SearchNewsBar extends StatefulWidget {
  const SearchNewsBar({super.key, required this.searchController});

  final TextEditingController searchController;

  @override
  State<SearchNewsBar> createState() => _SearchNewsBarState();
}

class _SearchNewsBarState extends State<SearchNewsBar> {
  final _debouncer = Debouncer(milliseconds: 300);

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
          widget.searchController.clear();
          context.read<NewsBloc>().add(FetchNewsEvent());
        },
        onChanged: (value) {
          if (value.length >= 3) {
            _debouncer.run(() {
              context.read<NewsBloc>().add(SearchNewsByName(title: widget.searchController.text));
            });
          }
        },
      ),
    );
  }
}
