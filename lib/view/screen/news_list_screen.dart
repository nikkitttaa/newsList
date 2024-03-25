import 'package:flutter/material.dart';
import 'package:news_list/view/components/news_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                vertical: 10,
              ),
              child: Text(
                AppLocalizations.of(context)!.allNews,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),

            //list
            const Expanded(child: NewsTile())
          ],
        ),
      ),
    );
  }
}
