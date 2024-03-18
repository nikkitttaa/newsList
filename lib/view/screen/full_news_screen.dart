import 'package:flutter/material.dart';
import 'package:new_webant/model/news_model.dart';

class FullNewsScreen extends StatelessWidget {
  const FullNewsScreen({super.key});

  Future<NewsModel> fetchData() {
    return Future.delayed(
        const Duration(),
        () => NewsModel(
            newsName:
                'Здоровый образ жизни: советы и инструменты по питанию и упражнениям для достижения успеха',
            imagePath: 'assets/images/food_image.jfif',
            newsDescription:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec venenatis lectus, et dapibus eros. Praesent id magna quis purus pharetra scelerisque ut quis felis. Duis dictum efficitur purus et blandit. Duis vel consequat dui. Nullam euismod, nisl eu fermentum convallis, arcu lectus sagittis ipsum, in elementum tortor purus vitae ligula. Mauris at enim elementum, laoreet metus sit amet, cursus orci. Sed nec elit libero. In accumsan mi non sollicitudin tincidunt. Proin molestie orci id pulvinar placerat.'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<NewsModel>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) 
              {
                return const Center(child: CircularProgressIndicator());
              } 
              else if (snapshot.hasError) 
              {
                return const Center(child: Text('Ошибка при загрузке данных'));
              } 
              else 
              {
                return SafeArea(
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          height: 235,
                          width: 380,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                snapshot.data!.imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10,),
                        child: Text(
                          snapshot.data!.newsName,
                          style: const TextStyle(fontSize: 24,),
                        ),
                      ),

                      Container(
                        width: 380,
                        height: 1,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(196, 196, 196, 196),),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text(
                          snapshot.data!.newsDescription,
                          style: const TextStyle(fontSize: 16, color: Colors.grey,),
                        ),
                      ),

                      //кнопка перейти в источник
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16, left: 24,),
                          child: Container(
                            height: 40,
                            width: 236,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 19,),
                                  child: Image.asset(
                                    'assets/images/vector.png',
                                    color: Colors.black,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Text(
                                    'Перейти в источник',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ]
                  ),
                ),
              );
            }
          }
        )
      );
  }
}
