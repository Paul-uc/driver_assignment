import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:user_management_system/src/features/authentication/models/user_model.dart';
import 'package:user_management_system/src/repository/authentication_repository/authentication_repository.dart';
import 'package:user_management_system/src/repository/user_repository/user_repository.dart';

import '../screens/forget_password/forget_password_otp/otp_screen.dart';


class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  /// Loader
  final isLoading = false.obs;
  final isGoogleLoading = false.obs;
  final isFacebookLoading = false.obs;

  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final phoneNo = TextEditingController();

  final userRepo = Get.put(UserRepository());

  void registerUser(String email, String password) {
    String? error = AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password) as String?;
    if (error != null){
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }

  Future <void> createUser(UserModel user) async {

    try {
      final user = UserModel(
          email: email.text.trim(),
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          password: password.text.trim(),
          phoneNo: phoneNo.text.trim());


      final auth = AuthenticationRepository.instance;
      await auth.loginWithEmailAndPassword(
          email.text.trim(), password.text.trim());
      await userRepo.createUser(user);
      auth.setInitialScreen(auth.firebaseUser);

      phoneAuthentication(user.phoneNo);
      Get.to(()  => const OTPScreen());


    }catch  (e){
      isLoading.value = false;
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 5));
    }



  }

  Future <void> phoneAuthentication(String phoneNo) async {
    try{
      await AuthenticationRepository.instance.phoneAuthentication(phoneNo);
    } catch (e) {
      throw e.toString();
    }
  }
}
