import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sport_app/core/components/app_language.dart';
import 'package:sport_app/core/components/default_buttons.dart';
import 'package:sport_app/core/style/app_text_style.dart';
import 'package:sport_app/core/utils/navigation_utility.dart';
import 'package:sport_app/modules/contact_us_form_2.dart';

import '../core/components/custom_app_bar_with_icon.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> _keyState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _keyState,
        child: SingleChildScrollView(
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
                  controller: firstNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return getLang(context).first_name_cannot_be_empty;
                    }
                  },
                  decoration: InputDecoration(
                      labelText: getLang(context).first_name,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: secondNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return getLang(context).second_name_cannot_be_empty;
                    }
                  },
                  decoration: InputDecoration(
                      labelText: getLang(context).second_name,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return getLang(context).email_cannot_be_empty;
                    } else if (!value.contains(RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
                      return getLang(context).enter_valid_email;
                    }
                  },
                  decoration: InputDecoration(
                      labelText: getLang(context).email,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: phoneController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return getLang(context).phone_cannot_be_empty;
                    } else if (value.length != 10) {
                      return getLang(context).phone_must_be_ten_digits;
                    } else if (!value.startsWith("05")) {
                      return getLang(context).phone_must_start_with;
                    } else if (!value
                        .contains(RegExp("^(?:[+0]9)?[0-9]{10}"))) {
                      return getLang(context).enter_valid_phone_number;
                    }
                  },
                  decoration: InputDecoration(
                      labelText: getLang(context).phone,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: DefaultButton(
                  onPress: () {
                    if (_keyState.currentState!.validate()) {
                      NavigationUtils.navigateTo(
                          context: context,
                          destinationScreen: const ContactUsForm2Screen());
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
  }
}
