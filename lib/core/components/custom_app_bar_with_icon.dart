import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_app/core/style/app_colors.dart';
import 'package:sport_app/core/utils/navigation_utility.dart';

import '../../layout/main_screen.dart';

class CustomAppBarWithIcon extends StatelessWidget {
  CustomAppBarWithIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          height: 150.h,
          color: AppColors.primaryColor,
          child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/nav.png"),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.center,
              child: Image.asset("assets/icons/logo.png")),
        ),
        IconButton(
          onPressed: () {
            if (icon == Icons.close) {
              NavigationUtils.navigateAndClearStack(
                  context: context, destinationScreen: MainScreen());
            } else {
              NavigationUtils.navigateBack(context: context);
            }
            NavigationUtils.navigateBack(context: context);
          },
          icon: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
