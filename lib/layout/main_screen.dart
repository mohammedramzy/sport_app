import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_app/core/components/custom_app_bar.dart';
import 'package:sport_app/core/style/app_colors.dart';

import '../core/components/app_language.dart';
import '../core/components/build_popup.dart';
import '../core/components/default_buttons.dart';
import '../core/components/default_icons.dart';
import '../core/style/app_text_style.dart';
import '../core/utils/navigation_utility.dart';
import '../cubits/app_root/main_cubit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future<bool> _showExitDialog() {
    return buildPopUpMessage(
      context: context,
      content: Text(
        getLang(context).exit,
        style: AppTextStyle.bodyText(),
      ),
      title: const ImageIcon(
        AssetImage('assets/icons/logo.png'),
      ),
      actions: [
        DefaultButton(
          onPress: () {
            exit(0);
          },
          buttonText: getLang(context).yes,
          buttonWidth: 70.w,
          buttonHeight: 30.h,
        ),
        DefaultButton(
          onPress: () {
            NavigationUtils.navigateBack(
              context: context,
            );
          },
          buttonText: getLang(context).no,
          buttonWidth: 70.w,
          buttonHeight: 30.h,
        ),
      ],
    ) as Future<bool>;
  }

  Widget? _bottomNavBar(MainCubit mainCubit) {
    return BottomNavigationBar(
      selectedItemColor: AppColors.selectedBottomNavBarItem,
      unselectedItemColor: AppColors.unSelectedBottomNavBarItem,
      currentIndex: mainCubit.currentIndex,
      backgroundColor: AppColors.primaryColor,
      onTap: (val) {
        mainCubit.changeBottomNav(val);
      },
      items: [
        BottomNavigationBarItem(
          label: getLang(context).home_screen,
          icon: const Icon(
            Icons.home,
          ),
        ),
        BottomNavigationBarItem(
          label: getLang(context).league_table_screen,
          icon: const Icon(
            Icons.schedule,
          ),
        ),
        BottomNavigationBarItem(
          label: getLang(context).news_screen,
          icon: const Icon(
            Icons.newspaper,
          ),
        ),
        BottomNavigationBarItem(
          label: getLang(context).statistics_screen,
          icon: const Icon(
            Icons.star,
          ),
        ),
        BottomNavigationBarItem(
          label: getLang(context).more_screen,
          icon: const Icon(
            Icons.more,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        var mainCubit = MainCubit.get(context);
        return WillPopScope(
          onWillPop: _showExitDialog,
          child: Scaffold(
            body: mainCubit.screens[mainCubit.currentIndex],
            bottomNavigationBar: _bottomNavBar(mainCubit),
          ),
        );
      },
    );
  }
}
