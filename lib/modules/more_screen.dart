import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_app/core/components/app_language.dart';
import 'package:sport_app/core/components/default_icons.dart';
import 'package:sport_app/core/style/app_colors.dart';
import 'package:sport_app/core/style/app_text_style.dart';
import 'package:sport_app/core/utils/navigation_utility.dart';
import 'package:sport_app/modules/contact_us.dart';

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
                    getLang(context).clubs_guide,
                    style: AppTextStyle.headLine()
                        .copyWith(color: AppColors.backGroundColor),
                  ),
                ),
                ListTile(
                  title: Text(
                    getLang(context).games_guide,
                    style: AppTextStyle.headLine()
                        .copyWith(color: AppColors.backGroundColor),
                  ),
                ),
                ListTile(
                  title: Text(
                    getLang(context).who_we_us,
                    style: AppTextStyle.headLine()
                        .copyWith(color: AppColors.backGroundColor),
                  ),
                ),
                ListTile(
                  title: Text(
                    getLang(context).systems_conditions,
                    style: AppTextStyle.headLine()
                        .copyWith(color: AppColors.backGroundColor),
                  ),
                ),
                ListTile(
                  title: Text(
                    getLang(context).committees,
                    style: AppTextStyle.headLine()
                        .copyWith(color: AppColors.backGroundColor),
                  ),
                ),
                ListTile(
                  onTap: () {
                    NavigationUtils.navigateTo(
                        context: context,
                        destinationScreen: const ContactUsScreen());
                  },
                  title: Text(
                    getLang(context).contact_us,
                    style: AppTextStyle.headLine()
                        .copyWith(color: AppColors.backGroundColor),
                  ),
                ),
                ListTile(
                  title: Text(
                    getLang(context).share_app,
                    style: AppTextStyle.headLine()
                        .copyWith(color: AppColors.backGroundColor),
                  ),
                ),
                ListTile(
                  title: Text(
                    getLang(context).subscribe_news,
                    style: AppTextStyle.headLine()
                        .copyWith(color: AppColors.backGroundColor),
                  ),
                ),
                const ListTile(
                    title: LangSwitch(
                  isExpanded: true,
                  width: 100,
                )),
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
