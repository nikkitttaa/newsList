import 'package:flutter/material.dart';
import 'package:news_list/model/news_model.dart';
import 'package:news_list/resource/app_colors.dart';
import 'package:news_list/view/components/link_to_source_button.dart';

import '../../generated/l10n.dart';

class FullNewsScreen extends StatelessWidget {
  const FullNewsScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<News>(
        future: News.fetchNewsById(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                AppLocalization.of(context).errorLoadingData,
              ),
            );
          } else {
            final News news = snapshot.data!;
            return SafeArea(
              child: SingleChildScrollView(
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
                            news.imageUrl,
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
                        news.title,
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
                        news.summary,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColor.summaryColor,
                        ),
                      ),
                    ),
                    LinkToSourceButton(
                      url: news.siteUrl,
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
