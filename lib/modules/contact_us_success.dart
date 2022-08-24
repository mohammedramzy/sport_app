import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/core/components/build_drop_down_button.dart';
import 'package:sport_app/core/components/build_pick_image_button.dart';
import 'package:sport_app/core/components/default_buttons.dart';
import 'package:sport_app/core/style/app_text_style.dart';
import 'package:sport_app/core/utils/navigation_utility.dart';
import 'package:sport_app/cubits/app_root/main_cubit.dart';
import 'package:sport_app/layout/main_screen.dart';

import '../core/components/app_language.dart';
import '../core/components/custom_app_bar_with_icon.dart';

class ContactUsSuccessScreen extends StatelessWidget {
  const ContactUsSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return WillPopScope(
            onWillPop: () => NavigationUtils.navigateAndClearStack(
                context: context,
                destinationScreen: const MainScreen()) as Future<bool>,
            child: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBarWithIcon(icon: Icons.close),
                  Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(getLang(context).request_send_successfully),
                        Text(getLang(context).request_no),
                        const Icon(
                          Icons.check_circle_outline_sharp,
                          color: Colors.green,
                          size: 100,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
