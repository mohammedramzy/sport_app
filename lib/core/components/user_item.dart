import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_app/models/user_response.dart';

import '../style/app_text_style.dart';

class UserItem extends StatefulWidget {
  UserItem({Key? key, required this.user}) : super(key: key);
  User user;
  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(widget.user.avatar!),
          ),
          SizedBox(width: 5.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.user.firstName!} ${widget.user.lastName!}",
                style: AppTextStyle.caption().copyWith(fontSize: 13),
              ),
              Text(
                widget.user.email!,
                style: AppTextStyle.caption().copyWith(fontSize: 13),
              ),
            ],
          )
        ],
      ),
    );
  }
}
