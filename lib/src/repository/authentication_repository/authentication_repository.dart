import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:user_management_system/src/exceptions/signup_email_password_failure.dart';
import 'package:user_management_system/src/features/authentication/screens/login/login_screen.dart';
import 'package:user_management_system/src/features/authentication/screens/mail_verification/mail_verification.dart';
import 'package:user_management_system/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:user_management_system/src/features/authentication/screens/welcome/welcome_screen.dart';

import '../../constants/t_exception.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //  Variables

  late final Rx<User?> _firebaseUser;
  late final _auth = FirebaseAuth.instance;
  final _phoneVerificationId = ''.obs;

//Getters
  User? get firebaseUser => _firebaseUser.value;

  String get getUserID => firebaseUser?.uid ?? "";

  String get getUserEmail => firebaseUser?.email ?? "";

  @override
  void onReady() {
    _firebaseUser = Rx<User?>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.userChanges());
    // ever(_firebaseUser, _setInitialScreen);
  }

  /// Setting initial screen
  setInitialScreen(User? user) async {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : user.emailVerified
            ? Get.offAll(() => SplashScreen())
            : Get.offAll(() => const MailVerification());
  }

  /* -------------------------------- Email & Password sign-in ----------------------------*/
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final result = TExceptions.fromCode(e.code);
      throw result.message;
    } catch (_) {
      const result = TExceptions();
      throw result.message;
    }
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _firebaseUser.value != null
          ? Get.offAll(() => SplashScreen())
          : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      final ex = TExceptions.fromCode(e.code);
      throw ex.message;
    } catch (_) {
      const ex = TExceptions();
      throw ex.message;
    }
  }

/* -------------------------------- Federated Identity & social sign-in -----------------------*/

  /// [Phone Authentication] - GOOGLE
  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      final ex = TExceptions.fromCode(e.code);
      throw ex.message;
    } catch (_) {
      const ex = TExceptions();
      throw ex.message;
    }
  }

  /// [Phone Authentication] - FACEBOOK
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.status == LoginStatus.success &&
        loginResult.accessToken != null) {
      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } else {
      throw FirebaseAuthException(
        code: 'facebook_login_failed',
        message: 'Facebook login failed. Please try again.',
      );
    }
  }

  /// [Phone Authentication] - LOGIN
  loginwithPhoneNo(String phoneNumber) async {}

  /// [Phone Authentication] - Register
  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: (verificationId, resendToken) {
        _phoneVerificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        _phoneVerificationId.value = verificationId;
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'The provided phone number is invalid');
        } else {
          Get.snackbar('Error', 'Something went wrong. Try Again. ');
        }
      },
    );
  }

  /// [Phone Authentication] - VERIFY PHONE NO BY OTP
  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: _phoneVerificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  /// [LogoutUser] - Valid for any validation.
  Future<void> Logout() async {
    try {
      await GoogleSignIn().signOut();
      // await FacebookAuth.instance.signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    } on FormatException catch (e) {
      throw e.message;
    } catch (e) {
      throw "Unable to logout, Try Again Later";
    }
  }
}
