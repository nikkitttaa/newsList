import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list/domain/model/news_model.dart';
import 'package:news_list/generated/l10n.dart';
import 'package:news_list/injection/di.dart';
import 'package:news_list/presentation/bloc/news_bloc/news_bloc.dart';
import 'package:news_list/presentation/components/news_tile_item.dart';
import 'package:news_list/presentation/components/widgets/search_bar.dart';
import 'package:news_list/resource/extension/scroll_notification_extension.dart';

class NewsTile extends StatefulWidget {
  const NewsTile({
    Key? key,
  }) : super(key: key);

  @override
  State<NewsTile> createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    searchController;
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(
        newsRepository: locator(),
      )..add(FetchNewsEvent()),
      child: Builder(builder: (context) {
        return Column(
          children: [
            SearchNewsBar(
              searchController: searchController,
            ),
            Expanded(
              child: BlocBuilder<NewsBloc, NewsState>(
                builder: (context, state) {
                  if (state.status == NewsStatus.initial) {
                    return Center(
                      child: Text(AppLocalization.of(context).waitingDataLoad),
                    );
                  } else if (state.status == NewsStatus.loading && state.isFirstLoad) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.status == NewsStatus.error) {
                    return Center(
                      child: Text(AppLocalization.of(context).errorLoadingData),
                    );
                  } else {
                    return NotificationListener<ScrollNotification>(
                      onNotification: (scrollNotification) => pagination(scrollNotification, context),
                      child: ListView.builder(
                        itemCount: state.newsList.length,
                        itemBuilder: (context, index) {
                          final News news = state.newsList[index];
                          final String description =
                              news.summary == '' ? AppLocalization.of(context).descriptionNotFound : news.summary;
                          return NewsTileItem(
                            news: news,
                            description: description,
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        );
      }),
    );
  }

  bool pagination(scrollNotification, context) {
    if (scrollNotification is ScrollEndNotification) {
      if (scrollNotification.hasReachedEnd) {
        BlocProvider.of<NewsBloc>(context).add(FetchNewsEvent());
        return true;
      }
    }
    return true;
  }
}
