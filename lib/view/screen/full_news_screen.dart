import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list/generated/l10n.dart';
import 'package:news_list/resource/app_colors.dart';
import 'package:news_list/view/bloc/full_news_bloc/full_news_bloc.dart';
import 'package:news_list/view/components/link_to_source_button.dart';

class FullNewsScreen extends StatelessWidget {
  const FullNewsScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocProvider<FullNewsBloc>(
          create: (context) => FullNewsBloc(id)..add(FetchNewsByIdEvent(id)),
          child: BlocBuilder<FullNewsBloc, FullNewsState>(
            builder: (context, state) {
              if (state is FullNewsInitial) {
                return Center(
                  child: Text(AppLocalization.of(context).waitingDataLoad),
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
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width * 0.02,
                        ),
                        child: SizedBox(
                          height: 235,
                          width: 380,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              state.newsById.imageUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => const Icon(
                                Icons.error,
                                color: AppColor.errorColor,
                                size: 50,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width * 0.05,
                          vertical: MediaQuery.sizeOf(context).height * 0.015,
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
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width * 0.05,
                          vertical: MediaQuery.sizeOf(context).height * 0.015,
                        ),
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
                return Center(
                  child: Text(AppLocalization.of(context).errorFullNews),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}