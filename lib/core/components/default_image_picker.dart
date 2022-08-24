import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sport_app/cubits/app_root/main_cubit.dart';

import '../style/app_text_style.dart';
import '../utils/navigation_utility.dart';
import 'build_popup.dart';

void defaultImagePicker({
  required BuildContext context,
}) {
  buildPopUpMessage(
    content: Text(
      "اختر مصدر الصورة",
      style: AppTextStyle.bodyText(),
    ),
    context: context,
    actions: [
      TextButton(
        onPressed: () {
          MainCubit.get(context).pickImage(
            source: ImageSource.gallery,
          );
          NavigationUtils.navigateBack(context: context);
        },
        child: Text(
          "الاستوديو",
          style: AppTextStyle.bodyText(),
        ),
      ),
      TextButton(
        onPressed: () {
          MainCubit.get(context).pickImage(
            source: ImageSource.camera,
          );
          NavigationUtils.navigateBack(context: context);
        },
        child: Text(
          "الكاميرا",
          style: AppTextStyle.bodyText(),
        ),
      ),
    ],
    title: const ImageIcon(
      AssetImage(
        "assets/icons/logo.png",
      ),
    ),
  );
}
