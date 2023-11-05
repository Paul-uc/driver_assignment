import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_management_system/src/common_widgets/form/form_divider.dart';
import 'package:user_management_system/src/constants/sizes.dart';
import 'package:user_management_system/src/constants/text_strings.dart';
import 'package:user_management_system/src/styles/spacing_styles.dart';

import '../../../../common_widgets/login_signup/social_buttons.dart';
import 'login_form_widget.dart';
import 'login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const  LoginHeader(),
              const LoginForm(),
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwItems,),
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}


