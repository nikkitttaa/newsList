import 'package:flutter/material.dart';
import 'package:new_webant/view/screen/full_news_screen.dart';
import 'package:new_webant/model/news_model.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({
    Key? key,
  }) : super(key: key);

  Future<NewsModel> fetchData() {
    return Future.delayed(
        const Duration(seconds: 2),
        () => NewsModel(
            newsName:
                'Здоровый образ жизни: советы и инструменты по питанию и упражнениям для достижения успеха',
            imagePath: 'assets/images/topic_image.png',
            newsDescription:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec venenatis lectus, et dapibus eros. Praesent id magna quis purus pharetra scelerisque ut quis felis. Duis dictum efficitur purus et blandit. Duis vel consequat dui. Nullam euismod, nisl eu fermentum convallis, arcu lectus sagittis ipsum, in elementum tortor purus vitae ligula. Mauris at enim elementum, laoreet metus sit amet, cursus orci. Sed nec elit libero. In accumsan mi non sollicitudin tincidunt. Proin molestie orci id pulvinar placerat.'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<NewsModel>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Ошибка при загрузке данных'));
              } else {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FullNewsScreen(),),);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Image.asset(snapshot.data!.imagePath, scale: 0.8),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: SizedBox(
                                width: 250,
                                child: Text(
                                  snapshot.data!.newsName,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
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
                                  snapshot.data!.newsDescription,
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  softWrap: true,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }
            }));
  }
}
