import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list/model/news_model.dart';
import 'package:news_list/view/bloc/news_bloc/news_bloc.dart';
import 'package:news_list/view/screen/full_news_screen.dart';
import 'package:news_list/resource/app_colors.dart';

import '../../generated/l10n.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsBloc>(
      create: (context) => NewsBloc(),
      child: BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
        if (state is NewsInitial) {
          BlocProvider.of<NewsBloc>(context).add(FetchNewsEvent());
          return const Center(
            child: Text('Initial'),
          );
        } else if (state is NewsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NewsError) {
          return Center(
            child: Text(AppLocalization.of(context).errorLoadingData),
          );
        } else if (state is NewsLoaded) {
          return ListView.builder(
              itemCount: state.newsList.length,
              itemBuilder: (context, index) {
                News news = state.newsList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullNewsScreen(
                          id: news.id,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 32, right: 32, bottom: 16),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.network(
                                news.imageUrl,
                                fit: BoxFit.cover,
                                scale: 1,
                                errorBuilder: (context, url, error) => const Icon(
                                  Icons.error,
                                  color: AppColor.errorColor,
                                  size: 50,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: SizedBox(
                              width: 230,
                              child: Text(
                                news.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 4),
                            child: SizedBox(
                              width: 250,
                              child: Text(
                                news.summary,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: AppColor.summaryColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                softWrap: true,
                              ),
                            ),
                          )
                        ]),
                      ]),
                    ]),
                  ),
                );
              });
        } else {
          return const Center(child: Text('Что то пошло не так :('));
        }
      }),
    );
  }
}
