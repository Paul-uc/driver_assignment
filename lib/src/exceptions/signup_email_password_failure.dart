

class SignUpWithEmailAndPasswordFailure{
  final String message;

  const SignUpWithEmailAndPasswordFailure([this.message = "An Unknown Error occurred."]);

  factory SignUpWithEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'weak-password' : return const SignUpWithEmailAndPasswordFailure('Please enter a stronger password');
      case 'invalid-email' : return const SignUpWithEmailAndPasswordFailure('Email is invalid');
      case 'email-already-in_use' : return const SignUpWithEmailAndPasswordFailure('An account already existed with this email');
      case 'operation-not-allowed' : return const SignUpWithEmailAndPasswordFailure('Operation is not allowed');
      case 'user_disabled' : return const SignUpWithEmailAndPasswordFailure('User has been disabled');
      default: return const SignUpWithEmailAndPasswordFailure();
  }

  }

}
