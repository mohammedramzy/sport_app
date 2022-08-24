import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_app/core/components/app_language.dart';
import 'package:sport_app/core/components/custom_app_bar_in_body.dart';
import 'package:sport_app/core/style/app_text_style.dart';
import 'package:sport_app/core/utils/navigation_utility.dart';
import 'package:sport_app/cubits/app_root/main_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/components/custom_app_bar.dart';

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
              body: state is GetNewsLoadingState
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          const CustomAppBarInBody(),
                          Container(
                            margin: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      getLang(context).news,
                                      style: AppTextStyle.bodyText(),
                                    ),
                                    GestureDetector(
                                      onTap: () => mainCubit.changeBottomNav(2),
                                      child: Text(
                                        "More",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Image.network(mainCubit.newsResponse[0].image!),
                                SizedBox(height: 5.h),
                                Text(
                                  getLang(context).localeName == "ar"
                                      ? mainCubit.newsResponse[0].titleAr!
                                      : mainCubit.newsResponse[0].titleEn!,
                                  maxLines: 1,
                                  style: AppTextStyle.caption().copyWith(
                                      overflow: TextOverflow.ellipsis),
                                ),
                                Text(
                                  getLang(context).localeName == "ar"
                                      ? mainCubit.newsResponse[0].contentAr!
                                      : mainCubit.newsResponse[0].contentEn!,
                                  maxLines: 1,
                                  style: AppTextStyle.bodyText().copyWith(
                                      overflow: TextOverflow.ellipsis),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Next Matches",
                                      style: AppTextStyle.bodyText(),
                                    ),
                                    GestureDetector(
                                      onTap: () => mainCubit.changeBottomNav(1),
                                      child: Text(
                                        "More",
                                        style: TextStyle(color: Colors.blue),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Image.network(
                                              mainCubit.videos[0].image!),
                                          const Icon(
                                            Icons.play_arrow,
                                            color: Colors.white,
                                            size: 100,
                                          )
                                        ],
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Sponsers",
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
