import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../controllers/signup_controller.dart';
import '../../models/user_model.dart';
import '../forget_password/forget_password_otp/otp_screen.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({
    super.key,
    required this.controller,
    required this.dark,
  });

  final SignUpController controller;
  final bool dark;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(

        children: [
          Row(
              children:[
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    decoration: const InputDecoration(label: Text(TTexts.firstName), prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastName,
                    decoration: const InputDecoration(label: Text(TTexts.lastName), prefixIcon: Icon(Iconsax.user)),
                  ),
                ),


              ]

          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                label: Text(TTexts.username), prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          TextFormField(
            decoration: const InputDecoration(
                label: Text(TTexts.email), prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          TextFormField(
            decoration: const InputDecoration(
                label: Text(TTexts.phoneNo), prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
                labelText: TTexts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash)),
          ),
          const SizedBox( height: TSizes.spaceBtwSections,),

          Row(
            children: [
              SizedBox(width: 24, height: 24, child: Checkbox(value: true, onChanged: (value) {})),
              const SizedBox(width: TSizes.spaceBtwItems,),
              Text.rich(
                TextSpan(children: [
                  TextSpan(text: '${TTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodyMedium),
                  TextSpan(text: '${TTexts.privacyPolicy} ', style: Theme.of(context).textTheme.bodySmall!.apply(
                    color: dark ? TColors.whiteColor :TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.whiteColor : TColors.primary,
                  )),
                  TextSpan(text: '${TTexts.and} ', style: Theme.of(context).textTheme.bodyMedium),
                  TextSpan(text: TTexts.termsOfUser, style: Theme.of(context).textTheme.bodySmall!.apply(
                    color: dark ? TColors.whiteColor :TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.whiteColor : TColors.primary,
                  )),
              ]),
              ),
            ],
          ),

          const SizedBox(height: TSizes.spaceBtwSections),


          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // SignUpController.instance.registerUser(
                    //     controller.email.text.trim(),
                    //     controller.password.text.trim());
                    SignUpController.instance
                        .phoneAuthentication(controller.phoneNo.text.trim());

                    final user = UserModel(

                      firstName: controller.firstName.text.trim(),
                      lastName: controller.lastName.text.trim(),
                      username: controller.username.text.trim(),
                      email: controller.email.text.trim(),
                      password: controller.password.text.trim(),
                      phoneNo: controller.phoneNo.text.trim(),
                    );
                    SignUpController.instance.createUser(user);

                    Get.to(() => const OTPScreen());
                  }
                },
                child: Text(TTexts.createAccount.toUpperCase()),
              )
          )
        ],
      ),
    );
  }
}