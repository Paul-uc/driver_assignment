import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:user_management_system/src/features/authentication/controllers/profile_controller.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../models/user_model.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(
          TTexts.tProfile,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(TSizes.defaultSize),
              child: FutureBuilder(
                  future: controller.getUserData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        UserModel user = snapshot.data as UserModel;

                        final email = TextEditingController(text: user.email);
                        final password = TextEditingController(text: user.password);
                        final firstName = TextEditingController(text: user.firstName);
                        final lastName = TextEditingController(text: user.lastName);
                        final username = TextEditingController(text: user.username);
                        final phoneNo = TextEditingController(text: user.phoneNo);

                        return Column(
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  width: 120,
                                  height: 120,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: const Image(
                                          image: AssetImage(TImages.tProfileImage))),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: TColors.primary),
                                      child: const Icon(
                                        LineAwesomeIcons.camera,
                                        size: 20.0,
                                        color: Colors.black,
                                      )),
                                ),
                              ],
                            ),
                            const SizedBox(height: 50),

                            // -- Form Fields
                            Form(
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: firstName,

                                      decoration: const InputDecoration(
                                          label: Text(TTexts.firstName),
                                          prefixIcon:
                                              Icon(LineAwesomeIcons.user))),
                                  const SizedBox(height: TSizes.spaceBtwSections),
                                  TextFormField(
                                      controller: firstName,

                                      decoration: const InputDecoration(
                                          label: Text(TTexts.lastName),
                                          prefixIcon:
                                          Icon(LineAwesomeIcons.user))),
                                  const SizedBox(height: TSizes.spaceBtwSections),
                                  TextFormField(
                                      controller: firstName,

                                      decoration: const InputDecoration(
                                          label: Text(TTexts.username),
                                          prefixIcon:
                                          Icon(LineAwesomeIcons.user))),
                                  const SizedBox(height: TSizes.spaceBtwSections),
                                  TextFormField(
                                      controller: email,

                                      decoration: const InputDecoration(
                                          label: Text(TTexts.email),
                                          prefixIcon: Icon(
                                              LineAwesomeIcons.envelope_1))),
                                  const SizedBox(height: TSizes.spaceBtwSections),
                                  TextFormField(
                                      controller: phoneNo,

                                      decoration: const InputDecoration(
                                          label: Text(TTexts.phoneNo),
                                          prefixIcon:
                                              Icon(LineAwesomeIcons.phone))),
                                  const SizedBox(height: TSizes.spaceBtwSections),
                                  TextFormField(
                                      controller: password,

                                      decoration: const InputDecoration(
                                          label: Text(TTexts.password),
                                          prefixIcon: Icon(
                                              LineAwesomeIcons.fingerprint))),
                                  const SizedBox(height: TSizes.spaceBtwSections/2),

                                  /// -- Form Submit Button
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        final userData = UserModel(
                                          email: email.text.trim(),
                                          password:password.text.trim(),

                                          phoneNo: phoneNo.text.trim(), firstName: firstName.text.trim(), lastName: lastName.text.trim(), username: username.text.trim(),
                                        );

                                        await controller.updateRecord(userData);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: TColors.primary,
                                          side: BorderSide.none,
                                          shape: const StadiumBorder()),
                                      child: const Text(tEditProfile,
                                          style: TextStyle(color: TColors.darkColor)),
                                    ),
                                  ),
                                  const SizedBox(height: TSizes.spaceBtwSections),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text.rich(
                                        TextSpan(
                                          text: tJoined,
                                          style: TextStyle(fontSize: 12),
                                          children: [
                                            TextSpan(
                                                text: tJoinedAt,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12))
                                          ],
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Colors.redAccent.withOpacity(0.1),
                                          elevation: 0,
                                          foregroundColor: Colors.red,
                                          shape: const StadiumBorder(),
                                          side: BorderSide.none,
                                        ),
                                        child: const Text(tDelete),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        );
                      }
                    } else if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else {
                      return const Center(child: Text('Something went wrong'));
                    }
                    return const Center(child: CircularProgressIndicator());
                  }))),
    );
  }
}
