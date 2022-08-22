import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_app/core/components/app_language.dart';
import 'package:sport_app/core/components/default_icons.dart';
import 'package:sport_app/core/style/app_colors.dart';
import 'package:sport_app/core/style/app_text_style.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width.w,
        height: MediaQuery.of(context).size.height.h,
        color: AppColors.primaryColor,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.only(top: 25.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LogoIcon(),
                ListTile(
                  title: Text(
                    "دليل النوادي",
                    style: AppTextStyle.headLine()
                        .copyWith(color: AppColors.backGroundColor),
                  ),
                ),
                ListTile(
                  title: Text(
                    "دليل الملاعب",
                    style: AppTextStyle.headLine()
                        .copyWith(color: AppColors.backGroundColor),
                  ),
                ),
                ListTile(
                  title: Text(
                    "من نحن",
                    style: AppTextStyle.headLine()
                        .copyWith(color: AppColors.backGroundColor),
                  ),
                ),
                ListTile(
                  title: Text(
                    "الأنظمة واللوائح",
                    style: AppTextStyle.headLine()
                        .copyWith(color: AppColors.backGroundColor),
                  ),
                ),
                ListTile(
                  title: Text(
                    "اللجان",
                    style: AppTextStyle.headLine()
                        .copyWith(color: AppColors.backGroundColor),
                  ),
                ),
                ListTile(
                  title: Text(
                    "اتصل بنا",
                    style: AppTextStyle.headLine()
                        .copyWith(color: AppColors.backGroundColor),
                  ),
                ),
                ListTile(
                  title: Text(
                    "شارك التطبيق",
                    style: AppTextStyle.headLine()
                        .copyWith(color: AppColors.backGroundColor),
                  ),
                ),
                ListTile(
                  title: Text(
                    "الاشتراك بالنشرة الاخبارية",
                    style: AppTextStyle.headLine()
                        .copyWith(color: AppColors.backGroundColor),
                  ),
                ),
                Container(
                  width: double.infinity.w,
                  padding: getLang(context).localeName == "ar"
                      ? EdgeInsets.only(left: 10.w)
                      : EdgeInsets.only(right: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/icons/facebook.png",
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/icons/twitter.png',
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/icons/instagram.png',
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/icons/linked_in.png',
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/icons/youtube.png',
                        ),
                      ),
                    ],
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
