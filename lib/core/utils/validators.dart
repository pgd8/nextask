import 'package:email_validator/email_validator.dart';

class Validators {
  static String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }

    if (!EmailValidator.validate(email)) {
      return 'Enter a valid email';
    }

    return null;
  }

  static String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }

    if (password.length < 8) {
      return 'Password mus be at least 8 charcters';
    }

    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Password at least must contain 1 Upper case letter';
    }

    if (!password.contains(RegExp(r'[a-z]'))) {
      return 'Password must at least contain 1 lower case letter';
    }

    if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Password must at least contain 1 number';
    }

    if (!password.contains(RegExp(r'[!@#$%^&*()=:{}<>/\\+_,."?|-]'))) {
      return 'Password must contain a special character';
    }
    return null;
  }
}
