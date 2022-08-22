import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_app/core/style/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const CustomAppBar({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: Container(
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

  @override
  Size get preferredSize => Size.fromHeight(height);
}
