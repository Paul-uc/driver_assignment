import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:user_management_system/src/common_widgets/login_signup/social_buttons.dart';
import 'package:user_management_system/src/features/authentication/controllers/signup_controller.dart';
import 'package:user_management_system/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:user_management_system/src/features/authentication/screens/signup/signup_form.dart';
import 'package:user_management_system/src/utils/helpers/helper_functions.dart';
import '../../../../common_widgets/form/form_divider.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../models/user_model.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
   final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
      child: Padding(
        padding:  const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(TTexts.tSignUp, style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: TSizes.spaceBtwSections),

            SignUpForm(controller: controller, dark: dark),


        const SizedBox(height: TSizes.spaceBtwSections),

            TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),

        const SizedBox(height: TSizes.spaceBtwSections),


        const TSocialButtons(),
          ],
        ),
      ),
    ),
    );
  }
}


