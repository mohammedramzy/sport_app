import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/app_colors.dart';

class CustomAppBarInBody extends StatelessWidget {
  const CustomAppBarInBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: Container(
        height: 150.h,
        padding: EdgeInsets.only(bottom: 20.h),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/nav.png"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomCenter,
        child: Image.asset("assets/icons/logo.png"),
      ),
    );
  }
}
