import 'package:flutter/material.dart';
import 'package:news_list/model/news_model.dart';
import 'package:news_list/resource/app_colors.dart';
import 'package:news_list/view/screen/full_news_screen.dart';

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
                      padding: EdgeInsets.only(
                        left: MediaQuery.sizeOf(context).width * 0.01,
                      ),
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
                      padding: EdgeInsets.only(
                        left: MediaQuery.sizeOf(context).width * 0.01,
                        top: MediaQuery.sizeOf(context).width * 0.012,
                      ),
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
