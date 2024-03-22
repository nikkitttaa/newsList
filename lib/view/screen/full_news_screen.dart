import 'package:flutter/material.dart';
import 'package:news_list/model/news_model.dart';
import 'package:news_list/resource/app_colors.dart';
import 'package:news_list/view/components/full_news_body.dart';
import 'package:news_list/view/components/link_to_source_button.dart';

import '../../generated/l10n.dart';

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
        )));
  }
}
