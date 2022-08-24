import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/app_colors.dart';

class CustomAppBarWithTabs extends StatefulWidget {
  CustomAppBarWithTabs({Key? key, required this.tabs}) : super(key: key);
  List<Tab> tabs;
  @override
  State<CustomAppBarWithTabs> createState() => _CustomAppBarWithTabsState();
}

class _CustomAppBarWithTabsState extends State<CustomAppBarWithTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: Container(
        height: 150.h,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/nav.png"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset("assets/icons/logo.png"),
            TabBar(
              tabs: widget.tabs,
              indicatorWeight: 4,
              indicatorColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
