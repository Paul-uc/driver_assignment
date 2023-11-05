import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:user_management_system/src/constants/sizes.dart';
import 'package:user_management_system/src/constants/text_strings.dart';

import '../../../../../common_widgets/form/form_header_widget.dart';
import '../../../../../constants/image_strings.dart';
import '../forget_password_otp/otp_screen.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(TSizes.defaultSize),
          child: Column(
            children: [
              const SizedBox(height:TSizes.defaultSize * 4),
               const FormHeader(
                image: TImages.tForgetPasswordImage,
                title: tForgetPasswordTitle,
                subTitle: tForgetPasswordSubTitle,
                crossAxisAlignment: CrossAxisAlignment.center,
                heightBetween: 30.0,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.formHeight),
              Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text(TTexts.email),
                          hintText: TTexts.email,
                          prefixIcon: Icon(Icons.mail_outline_rounded),
                        ),
                      ),
                      const SizedBox(height: 20.0,),
                      SizedBox(
                        width: double.infinity,
                      child: ElevatedButton(onPressed: (){Get.to(() => const OTPScreen());}, child: const Text(TTexts.next))),
                    ],
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
