import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list/generated/l10n.dart';
import 'package:news_list/view/bloc/full_news_bloc/full_news_bloc.dart';

import '../../resource/app_colors.dart';
import 'link_to_source_button.dart';

class FullNewsBody extends StatelessWidget {
  const FullNewsBody({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FullNewsBloc>(
      create: (context) => FullNewsBloc(id)..add(FetchNewsByIdEvent()),
      child: BlocBuilder<FullNewsBloc, FullNewsState>(builder: (context, state) {
        if (state is FullNewsInitial) {
          return const Center(
            child: Text('Initial'),
          );
        } else if (state is FullNewsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FullNewsError) {
          return Center(
            child: Text(AppLocalization.of(context).errorLoadingData),
          );
        } else if (state is FullNewsLoaded) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 235,
                    width: 380,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        state.newsById.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, url, error) => const Icon(
                          Icons.error,
                          color: AppColor.errorColor,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Text(
                    state.newsById.title,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                Container(
                  width: 380,
                  height: 1,
                  decoration: const BoxDecoration(
                    color: AppColor.greyLine,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    state.newsById.summary,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColor.summaryColor,
                    ),
                  ),
                ),
                LinkToSourceButton(
                  url: state.newsById.siteUrl,
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text('что то пошло не так :('),
          );
        }
      }),
    );
  }
}