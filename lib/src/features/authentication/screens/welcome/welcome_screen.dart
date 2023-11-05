import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_management_system/src/constants/colors.dart';
import 'package:user_management_system/src/constants/sizes.dart';
import 'package:user_management_system/src/features/authentication/screens/login/login_screen.dart';


import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';
import '../signup/signup_form_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = MediaQuery.of(context).size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
        backgroundColor: isDarkMode ? TColors.dark : TColors.whiteColor,
        body: Container(
          padding: const EdgeInsets.all(TSizes.defaultSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                  image: const AssetImage(TImages.tWelcomeScreenImage), height: height * 0.6),
              Column(
                children: [
                  Text(
                    TTexts.tWelcomeTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    TTexts.tWelcomeSubtitle,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () => Get.to(() => const LoginScreen()),
                          child: Text(TTexts.tLogin.toUpperCase()))),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () => Get.to(() => const SignUpScreen()),
                          child: Text(TTexts.tSignUp.toUpperCase()))),
                ],
              )
            ],
          ),
        ));
  }
}
