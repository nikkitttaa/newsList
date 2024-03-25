import 'package:flutter/material.dart';
import 'package:news_list/view/components/full_news_body.dart';

class FullNewsScreen extends StatelessWidget {
  const FullNewsScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: FullNewsBody(
          id: id,
        ),
      ),
    );
  }
}
