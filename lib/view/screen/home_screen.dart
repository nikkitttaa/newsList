import 'package:flutter/material.dart';
import 'package:new_webant/view/components/news_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          //txt
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.35,
                vertical: 10),
            child: const Text(
              'Все новости',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),

          const Expanded(child: NewsTile())
        ],
      )),
    );
  }
}
