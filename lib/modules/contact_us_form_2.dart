import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/core/components/app_language.dart';
import 'package:sport_app/core/components/build_drop_down_button.dart';
import 'package:sport_app/core/components/build_pick_image_button.dart';
import 'package:sport_app/core/components/build_popup.dart';
import 'package:sport_app/core/components/default_buttons.dart';
import 'package:sport_app/core/style/app_text_style.dart';
import 'package:sport_app/core/utils/navigation_utility.dart';
import 'package:sport_app/cubits/app_root/main_cubit.dart';
import 'package:sport_app/modules/contact_us.dart';
import 'package:sport_app/modules/contact_us_success.dart';

import '../core/components/custom_app_bar_with_icon.dart';

class ContactUsForm2Screen extends StatefulWidget {
  const ContactUsForm2Screen({Key? key}) : super(key: key);

  @override
  State<ContactUsForm2Screen> createState() => _ContactUsForm2ScreenState();
}

class _ContactUsForm2ScreenState extends State<ContactUsForm2Screen> {
  TextEditingController messageController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final GlobalKey<FormState> _keyState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          var mainCubit = MainCubit.get(context);
          return Form(
            key: _keyState,
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBarWithIcon(icon: Icons.arrow_back_ios),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Text(
                        getLang(context).contact_us,
                        style: AppTextStyle.bodyText(),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: TextFormField(
                        controller: addressController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return getLang(context).address_cannot_be_empty;
                          }
                        },
                        decoration: InputDecoration(
                            labelText: getLang(context).address,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5))),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.all(20),
                        child: DefaultDropDownButton(
                          values: [
                            getLang(context).complaint,
                            getLang(context).services
                          ],
                          dropDownValue: getLang(context).services,
                          isExpanded: false,
                          labelText: getLang(context).message_type,
                          onChangeFun: (val) {},
                        )),
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: TextFormField(
                        controller: messageController,
                        maxLines: 6,
                        minLines: 6,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return getLang(context).message_cannot_be_empty;
                          }
                        },
                        decoration: InputDecoration(
                            labelText: getLang(context).message_content,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5))),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: PickOneImageButton(
                          pickedImage: MainCubit.get(context).imagePicked,
                          buttonHeight: 50,
                          buttonWidth: double.infinity,
                          imageText: getLang(context).pick_up_image,
                          buttonText: getLang(context).pick_up_image),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: DefaultButton(
                        onPress: () {
                          if (_keyState.currentState!.validate()) {
                            NavigationUtils.navigateTo(
                                context: context,
                                destinationScreen:
                                    const ContactUsSuccessScreen());
                          }
                        },
                        buttonText: getLang(context).next,
                        buttonHeight: 50,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
