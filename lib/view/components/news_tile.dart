import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list/generated/l10n.dart';
import 'package:news_list/model/news_model.dart';
import 'package:news_list/view/bloc/news_bloc/news_bloc.dart';
import 'package:news_list/view/components/news_tile_item.dart';

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
            return Center(
              child: Text(AppLocalization.of(context).waitingDataLoad),
            );
          } else if (state.status == NewsStatus.loading) {
            // state.status.isLoaded так надо
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
                //func make
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
                    }
                  }),
            );
          } else {
            return Center(child: Text(AppLocalization.of(context).errorFullNews));
          }
        },
      ),
    );
  }
}
