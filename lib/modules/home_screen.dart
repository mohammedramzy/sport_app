import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_app/core/components/app_language.dart';
import 'package:sport_app/core/components/custom_app_bar_in_body.dart';
import 'package:sport_app/core/style/app_text_style.dart';
import 'package:sport_app/cubits/app_root/main_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _launchUrl(String _url) async {
    if (!await launchUrl(Uri.parse(_url))) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          var mainCubit = MainCubit.get(context);
          return Scaffold(
              body: SingleChildScrollView(
            child: Column(
              children: [
                const CustomAppBarInBody(),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            getLang(context).news,
                            style: AppTextStyle.bodyText(),
                          ),
                          GestureDetector(
                            onTap: () => mainCubit.changeBottomNav(2),
                            child: Text(
                              getLang(context).more,
                              style: const TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Image.asset(
                        "assets/images/home_news.jpg",
                        width: double.infinity.w,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        getLang(context).localeName == "ar"
                            ? "الدوري الرياضي"
                            : "League Sport",
                        maxLines: 1,
                        style: AppTextStyle.caption()
                            .copyWith(overflow: TextOverflow.ellipsis),
                      ),
                      Text(
                        getLang(context).localeName == "ar"
                            ? "من الملاعب السعودية إلى منصة التتويج بكأس العالم.."
                            : "From Saudi stadiums to the World Cup podium...",
                        maxLines: 1,
                        style: AppTextStyle.bodyText()
                            .copyWith(overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            getLang(context).next_matches,
                            style: AppTextStyle.bodyText(),
                          ),
                          GestureDetector(
                            onTap: () => mainCubit.changeBottomNav(1),
                            child: Text(
                              getLang(context).more,
                              style: const TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/match.jpg",
                          ),
                          Image.asset(
                            "assets/images/match.jpg",
                          ),
                          Image.asset(
                            "assets/images/match.jpg",
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            getLang(context).localeName == "ar"
                                ? "آخر التغريدات"
                                : "Latest Tweets",
                            style: AppTextStyle.bodyText(),
                          ),
                          GestureDetector(
                            child: Text(
                              getLang(context).more,
                              style: const TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(height: 25.h),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Image.asset("assets/icons/logo.png"),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "الدوري الرياضي",
                                          style: AppTextStyle.bodyText(),
                                        ),
                                        Text(
                                          "account@",
                                          style: AppTextStyle.caption(),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                const Text(
                                    "عندما يريد العالم أن ‪يتكلّم ‬ ، فهو يتحدّث بلغة يونيكود. تسجّل الآن لحضور المؤتمر الدولي العاشر ليونيكود (Unicode Conference)، الذي سيعقد في 10-12 آذار 1997 بمدينة مَايِنْتْس، ألمانيا. "),
                              ],
                            ),
                            SizedBox(height: 25.h),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Image.asset("assets/icons/logo.png"),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "الدوري الرياضي",
                                          style: AppTextStyle.bodyText(),
                                        ),
                                        Text(
                                          "account@",
                                          style: AppTextStyle.caption(),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                const Text(
                                    "عندما يريد العالم أن ‪يتكلّم ‬ ، فهو يتحدّث بلغة يونيكود. تسجّل الآن لحضور المؤتمر الدولي العاشر ليونيكود (Unicode Conference)، الذي سيعقد في 10-12 آذار 1997 بمدينة مَايِنْتْس، ألمانيا. "),
                              ],
                            ),
                            SizedBox(height: 25.h),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            getLang(context).localeName == "ar"
                                ? "توقع من هو الفائز"
                                : "Expect who win",
                            style: AppTextStyle.bodyText(),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(
                                          "assets/images/patch_club.png"),
                                      Text(
                                        "الاتحاد",
                                        style: AppTextStyle.headLine()
                                            .copyWith(fontSize: 16.sp),
                                      ),
                                      Text(
                                        "%30",
                                        style: AppTextStyle.caption()
                                            .copyWith(fontSize: 14.sp),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(
                                          "assets/images/patch_club.png"),
                                      Text(
                                        "الهلال",
                                        style: AppTextStyle.headLine()
                                            .copyWith(fontSize: 16.sp),
                                      ),
                                      Text(
                                        "%50",
                                        style: AppTextStyle.caption()
                                            .copyWith(fontSize: 14.sp),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(
                                          "assets/images/patch_club.png"),
                                      Text(
                                        "النهضة",
                                        style: AppTextStyle.headLine()
                                            .copyWith(fontSize: 16.sp),
                                      ),
                                      Text(
                                        "%20",
                                        style: AppTextStyle.caption()
                                            .copyWith(fontSize: 14.sp),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            getLang(context).videos,
                            style: AppTextStyle.bodyText(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        child: GestureDetector(
                            onTap: () {
                              _launchUrl(
                                  "https://www.youtube.com/watch?v=5hqrO-B703Q");
                            },
                            child: Image.asset(
                              "assets/images/video_image.jpg",
                              width: double.infinity.w,
                              fit: BoxFit.fill,
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            getLang(context).sponsers,
                            style: AppTextStyle.bodyText(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Image.asset(
                            "assets/images/sponser.jpg",
                            fit: BoxFit.fill,
                          )),
                          Expanded(
                              child: Image.asset(
                            "assets/images/sponser.jpg",
                            fit: BoxFit.fill,
                          )),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ));
        });
  }
}
