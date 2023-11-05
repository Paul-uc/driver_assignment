import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_management_system/src/constants/image_strings.dart';
import 'package:user_management_system/src/features/authentication/controllers/mail_verification_controller.dart';
import 'package:user_management_system/src/features/authentication/screens/login/login_screen.dart';

import '../../../../constants/sizes.dart';

class MailVerification extends StatelessWidget {
  const MailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MailVerificationController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Image(
                image: AssetImage(TImages.verifyIllustration),
              )
            ],
          ),
        ),
      ),
    );
  }
}
