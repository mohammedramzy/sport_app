import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../style/app_colors.dart';
import '../style/app_text_style.dart';
import 'default_buttons.dart';
import 'default_image_picker.dart';

class PickOneImageButton extends StatefulWidget {
  final String buttonText;
  final double buttonHeight;
  final double buttonWidth;
  final String imageText;
  final File? pickedImage;

  PickOneImageButton({
    Key? key,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.imageText,
    required this.buttonText,
    required this.pickedImage,
  }) : super(key: key);

  @override
  State<PickOneImageButton> createState() => _PickOneImageButtonState();
}

class _PickOneImageButtonState extends State<PickOneImageButton> {
  @override
  Widget build(BuildContext context) {
    return widget.pickedImage != null
        ? GestureDetector(
            onTap: () {
              defaultImagePicker(
                context: context,
              );
            },
            child: Column(
              children: [
                Text(
                  widget.imageText,
                  style: AppTextStyle.bodyText(),
                ),
                SizedBox(
                  height: 5.0.h,
                ),
                Container(
                  height: 50.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0.r),
                    image: DecorationImage(
                      image: widget.pickedImage != null
                          ? FileImage(
                              widget.pickedImage!,
                            )
                          : Container() as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          )
        : DefaultButton(
            onPress: () {
              defaultImagePicker(context: context);
            },
            buttonText: widget.buttonText,
            buttonHeight: widget.buttonHeight,
            buttonWidth: widget.buttonWidth,
            buttonBorderCircular: 15.r,
            buttonColor: AppColors.primaryColor,
            textColor: Colors.white,
          );
  }
}
