import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:user_management_system/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:user_management_system/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:user_management_system/src/constants/sizes.dart';
import 'package:user_management_system/src/features/authentication/controllers/fade_in_animation_controller.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();

    return Scaffold(
      body: Stack(
        children: [
          TFadeInAnimation(
              durationInMs: 1600,
              animate: TAnimatePosition(
                topAfter: 0,
                topBefore: -30,
                leftBefore: -30,
                leftAfter: 0,
              ),
              child: const Image(
                image: AssetImage(TImages.tSplashTopIcon),
                width: 200,
                // Set the desired width
                height: 200,
              )),
          TFadeInAnimation(
            durationInMs: 2000,
            animate: TAnimatePosition(
              topAfter: 80,
              topBefore: 80,
              leftBefore: -80,
              leftAfter: TSizes.defaultSize,
            ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(TTexts.appName,
                      style: Theme.of(context).textTheme.headlineMedium),
                  Text(TTexts.tAppTagLine,
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),

          TFadeInAnimation(
            durationInMs: 2400,
            animate: TAnimatePosition(
              bottomBefore: 0,
              bottomAfter: 100,
            ),
            child: const Image(image: AssetImage(TImages.tSplashImage), height: 400, width: 400,),
          ),
          TFadeInAnimation(
            durationInMs: 2400,
            animate: TAnimatePosition(
              bottomBefore: 0,
              bottomAfter: 60,
              rightBefore: TSizes.defaultSize,
              rightAfter: TSizes.defaultSize,
            ),
            child: Container(
              width: TSizes.defaultSize,
              height: TSizes.defaultSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: TColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
