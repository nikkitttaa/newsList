import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list/domain/model/news_model.dart';
import 'package:news_list/generated/l10n.dart';
import 'package:news_list/injection/di.dart';
import 'package:news_list/presentation/bloc/news_bloc/news_bloc.dart';
import 'package:news_list/presentation/components/news_tile_item.dart';
import 'package:news_list/resource/extension/scroll_notification_extension.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsBloc>(
      create: (context) => NewsBloc(
        newsRepository: locator(),
      )..add(FetchNewsEvent()),
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
                itemCount: state.newsList.length + 1,
                itemBuilder: (context, index) {
                  if (index < state.newsList.length) {
                    final News news = state.newsList[index];
                    final String description = news.summary == '' ? 'not found' : news.summary;
                    return NewsTileItem(
                      news: news,
                      description: description,
                    );
                  }
                  return null;
                },
              ),
            );
          }
        },
      ),
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
