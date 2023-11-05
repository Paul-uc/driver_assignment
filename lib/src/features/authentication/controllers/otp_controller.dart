
import 'package:get/get.dart';
import 'package:user_management_system/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:user_management_system/src/repository/authentication_repository/authentication_repository.dart';

class OTPController extends GetxController{
  static OTPController get instance => Get.find();


  void verifyOTP(String otp) async{
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(SplashScreen()) : Get.back();
  }
}