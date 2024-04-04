import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:news_list/domain/model/news_model.dart';
import 'package:news_list/internal/dependencies/resource/app_colors.dart';
import 'package:news_list/internal/dependencies/resource/app_theme.dart';
import 'package:news_list/presentation/screen/full_news_screen.dart';

class NewsTileItem extends StatelessWidget {
  const NewsTileItem({super.key, required this.news, required this.description, required this.locator});

  final News news;
  final String description;
  final GetIt locator;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FullNewsScreen(
              id: news.id,
              locator: locator,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(
          left: MediaQuery.sizeOf(context).width * 0.065,
          right: MediaQuery.sizeOf(context).width * 0.065,
          bottom: MediaQuery.sizeOf(context).height * 0.025,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    right: MediaQuery.sizeOf(context).width * 0.025,
                  ),
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
                        errorBuilder: (_, __, ___) => const Icon(
                          Icons.error,
                          color: AppColor.errorColor,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.sizeOf(context).width * 0.01,
                      ),
                      child: SizedBox(
                        width: 230,
                        child: Text(
                          news.title,
                          style: AppThemeData.titleForNewsListStyle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.sizeOf(context).width * 0.01,
                        top: MediaQuery.sizeOf(context).width * 0.012,
                      ),
                      child: SizedBox(
                        width: 250,
                        child: Text(
                          description,
                          style: AppThemeData.summaryStyle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: true,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
