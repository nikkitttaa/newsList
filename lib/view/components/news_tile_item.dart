import 'package:flutter/material.dart';

import '../../model/news_model.dart';
import '../../resource/app_colors.dart';
import '../screen/full_news_screen.dart';

class NewsTileItem extends StatelessWidget {
  const NewsTileItem({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
