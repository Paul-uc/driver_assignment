import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:user_management_system/src/constants/colors.dart';
import 'package:user_management_system/src/constants/sizes.dart';

class Helper extends GetxController {
  static String? validateEmail(value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!GetUtils.isEmail(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
  static successSnackBar({required title, message}) {
    Get.snackbar(title, message,
        isDismissible: true,
        colorText: TColors.textWhite,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 6),
        margin: const EdgeInsets.all(TSizes.defaultSize),
        icon: const Icon(LineAwesomeIcons.check_circle,
          color: TColors.textWhite,
        ));
  }

  static warningSnackBar({required title, message}) {
    Get.snackbar(title, message,
        isDismissible: true,
        colorText: TColors.textWhite,
        backgroundColor: Colors.yellow,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 6),
        margin: const EdgeInsets.all(TSizes.defaultSize),
        icon: const Icon(LineAwesomeIcons.check_circle,
          color: TColors.textWhite,
        ));
  }

  static errorSnackBar({required title, message}) {
    Get.snackbar(title, message,
        isDismissible: true,
        colorText: TColors.textWhite,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 6),
        margin: const EdgeInsets.all(TSizes.defaultSize),
        icon: const Icon(LineAwesomeIcons.check_circle,
          color: TColors.textWhite,
        ));
  }
}
