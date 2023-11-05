import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:user_management_system/src/constants/text_strings.dart';
import 'package:user_management_system/src/repository/authentication_repository/authentication_repository.dart';

import 'helper_controllers.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

/// TextField Controllers to get data from TextFields
  final showPassword = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey <FormState> loginFormKey = GlobalKey<FormState>();

  /// Loader
  final isLoading = false.obs;
  final isGoogleLoading = false.obs;
  final isFacebookLoading = false.obs;

  /// [EmailAndPasswordLogin]
  Future<void> login() async {
    try {
      isLoading.value = true;
      if (!loginFormKey.currentState!.validate()) {
        isLoading.value = false;
        return;
      }
      final auth = AuthenticationRepository.instance;
      await auth.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      auth.setInitialScreen(auth.firebaseUser);
    } catch (e) {
      isLoading.value = false;
      Helper.errorSnackBar(title: tOhSnap, message: e.toString());
    }
  }

/// [GoogleSignInAuthentication]
  Future <void> googleSignIn() async{
    try{
      isGoogleLoading.value = true;
      await AuthenticationRepository.instance.signInWithGoogle();
    } catch (e){
      isGoogleLoading.value = false;
    }
  }
}