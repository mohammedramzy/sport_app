import 'package:flutter/material.dart';
import 'package:sport_app/core/components/app_language.dart';
import 'package:sport_app/modules/show_images_screen.dart';
import 'package:sport_app/modules/show_news_screen.dart';
import 'package:sport_app/modules/show_videos_screen.dart';

import '../core/components/custom_app_bar_with_tabs.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          body: Column(
        children: [
          CustomAppBarWithTabs(tabs: [
            Tab(text: getLang(context).news),
            Tab(text: getLang(context).photos),
            Tab(text: getLang(context).videos)
          ]),
          const Expanded(
            child: TabBarView(
              children: [
                ShowNewsScreen(),
                ShowImagesScreen(),
                ShowVideosScreen(),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
