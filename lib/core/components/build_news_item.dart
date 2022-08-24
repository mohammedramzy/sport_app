import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_app/core/components/app_language.dart';
import 'package:sport_app/core/style/app_text_style.dart';
import 'package:sport_app/models/news_response.dart';

import '../../modules/view_news_screen.dart';

class NewsItem extends StatefulWidget {
  NewsItem({Key? key, required this.item}) : super(key: key);
  NewsResponse item;
  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => ViewNewsScreen(item: widget.item)));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            widget.item.image!,
            width: 150.w,
            height: 120.h,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getLang(context).localeName == "ar"
                      ? widget.item.titleAr!
                      : widget.item.titleEn!,
                  maxLines: 1,
                  style: AppTextStyle.caption()
                      .copyWith(fontSize: 15, overflow: TextOverflow.ellipsis),
                ),
                Text(
                  getLang(context).localeName == "ar"
                      ? widget.item.contentAr!
                      : widget.item.contentEn!,
                  maxLines: 2,
                  style: AppTextStyle.bodyText()
                      .copyWith(fontSize: 15, overflow: TextOverflow.ellipsis),
                ),
                Text(
                    "${DateTime.parse(widget.item.createdAt!).year} - ${DateTime.parse(widget.item.createdAt!).month} - ${DateTime.parse(widget.item.createdAt!).day}")
              ],
            ),
          )
        ],
      ),
    );
  }
}
