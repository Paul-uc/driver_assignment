import 'package:flutter/material.dart';
import 'package:user_management_system/src/constants/sizes.dart';
import 'package:user_management_system/src/utils/helpers/helper_functions.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            height: 150,
            image: AssetImage(dark? TImages.tWelcomeScreenImage : TImages.tWelcomeScreenImage),
          ),
        Text(TTexts.tLoginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: TSizes.sm,),
        Text(TTexts.tLoginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
