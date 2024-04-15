import 'package:flutter/material.dart';
import 'package:news_list/core/resource/app_icons.dart';
import 'package:news_list/core/resource/app_theme.dart';
import 'package:news_list/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkToSourceButton extends StatelessWidget {
  const LinkToSourceButton({
    super.key,
    required this.url,
  });

  final String url;

  void launchSite(String url) async {
    await launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchSite(url),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.sizeOf(context).height * 0.02,
            left: MediaQuery.sizeOf(context).width * 0.05,
          ),
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
                  padding: EdgeInsets.only(
                    left: MediaQuery.sizeOf(context).width * 0.04,
                  ),
                  child: Image.asset(
                    AppIcon.link,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.sizeOf(context).width * 0.04,
                  ),
                  child: Text(
                    AppLocalization.of(context).goToSource,
                    style: AppThemeData.linkBtnStyle,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
