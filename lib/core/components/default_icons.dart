import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/navigation_utility.dart';

class LogoIcon extends StatelessWidget {
  const LogoIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/icons/logo.png",
      width: 100.w,
      height: 100.h,
    );
  }
}

class BackIcon extends StatelessWidget {
  const BackIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.adaptive.arrow_back_outlined,
      ),
      onPressed: () {
        NavigationUtils.navigateBack(context: context);
      },
    );
  }
}
