import 'package:flutter/material.dart';
import 'package:new_webant/view/screen/full_news_screen.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const FullNewsScreen())));
      },
      child: Container(),
    );
  }
}
