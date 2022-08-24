import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_app/core/components/app_language.dart';
import 'package:sport_app/core/style/app_text_style.dart';
import 'package:sport_app/models/news_response.dart';

class ViewNewsScreen extends StatelessWidget {
  ViewNewsScreen({Key? key, required this.item}) : super(key: key);
  NewsResponse item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                item.image!,
                width: double.infinity.w,
                fit: BoxFit.cover,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              getLang(context).localeName == "ar"
                  ? item.titleAr!
                  : item.titleEn!,
              maxLines: 2,
              style: AppTextStyle.headLine().copyWith(fontSize: 18),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              "${DateTime.parse(item.createdAt!).year} - ${DateTime.parse(item.createdAt!).month} - ${DateTime.parse(item.createdAt!).day}",
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              getLang(context).localeName == "ar"
                  ? item.contentAr!
                  : item.contentEn!,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
