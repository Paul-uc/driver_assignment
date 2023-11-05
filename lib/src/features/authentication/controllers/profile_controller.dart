import 'package:get/get.dart';
import 'package:user_management_system/src/repository/authentication_repository/authentication_repository.dart';
import 'package:user_management_system/src/repository/user_repository/user_repository.dart';

import '../models/user_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());


  getUserData() {
    final email = _authRepo.firebaseUser?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("ERROR", "Login to continue");
    }
  }


  // Fetch List of User Record
  Future<List<UserModel>> getAllUsers() async => await _userRepo.allUser();
  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }
}
