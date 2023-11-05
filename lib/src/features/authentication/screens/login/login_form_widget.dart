import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_management_system/src/constants/text_strings.dart';
import 'package:user_management_system/src/features/authentication/screens/profile/profile.dart';
import '../../../../constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../signup/signup_form_widget.dart';


class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right), labelText: TTexts.email,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: TTexts.password,
                  suffixIcon: IconButton(
                    onPressed: null,
                    icon: Icon(Iconsax.eye_slash),
                  )),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields/2),


            /// Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                ///Remember Me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value){}),
                    const Text(TTexts.rememberMe),
                  ],
                ),
                TextButton(onPressed: () {}, child: const Text(TTexts.forgetPassword))
              ],

            ),
            const SizedBox(height: TSizes.spaceBtwSections,),

            // Sign In Button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => const ProfileScreen())
              ,child: const Text(TTexts.signIn),),),
            const SizedBox(height: TSizes.spaceBtwItems),

            SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () => Get.to(() => const SignUpScreen()),
              child: const Text(TTexts.createAccount),),),
            const SizedBox(height: TSizes.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}
