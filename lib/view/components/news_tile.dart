import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list/model/news_model.dart';
import 'package:news_list/view/bloc/news_bloc/news_bloc.dart';
import 'package:news_list/view/components/news_tile_item.dart';

import '../../generated/l10n.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsBloc>(
      create: (context) => NewsBloc()..add(FetchNewsEvent()),
      child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state.status == NewsStatus.initial) {
            return const Center(
              child: Text('Initial'),
            );
          } else if (state.status == NewsStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == NewsStatus.error) {
            return Center(
              child: Text(AppLocalization.of(context).errorLoadingData),
            );
          } else if (state.status == NewsStatus.loaded) {
            return NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollEndNotification) {
                  if (scrollNotification.metrics.pixels == scrollNotification.metrics.maxScrollExtent) {
                    BlocProvider.of<NewsBloc>(context).add(FetchNewsEvent());
                    return true;
                  }
                }
                return true;
              },
              child: ListView.builder(
                  itemCount: state.newsList.length + 1,
                  itemBuilder: (context, index) {
                    if (index < state.newsList.length) {
                      News news = state.newsList[index];
                      return NewsTileItem(news: news);
                    } else {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  }),
            );
          } else {
            return const Center(child: Text('Что то пошло не так :('));
          }
        },
      ),
    );
  }
}
