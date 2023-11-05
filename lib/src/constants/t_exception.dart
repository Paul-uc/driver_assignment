class TExceptions implements Exception{

  final String message;

  const TExceptions([this.message = 'An unknown exception occurred. ']);


  factory TExceptions.fromCode(String code){
    switch(code){
      case 'weak-password' :
        return const TExceptions('Please enter a stronger password');
      case 'invalid-email' : return const TExceptions('Email is invalid');
      case 'email-already-in_use' : return const TExceptions('An account already existed with this email');
      case 'operation-not-allowed' : return const TExceptions('Operation is not allowed');
      case 'user_disabled' : return const TExceptions('User has been disabled');
      default: return const TExceptions();    }
  }
}