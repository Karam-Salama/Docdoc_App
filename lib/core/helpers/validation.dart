// validation.dart

import 'package:doc_doc/core/helpers/app_regex.dart';
import 'package:email_validator/email_validator.dart';

class Validation {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Field is required';
    }
    if (!AppRegex.nameHasMinLength(value)) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  /// Validates the email format.
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Field is required';
    } else if (!EmailValidator.validate(value)) {
      return 'Please Enter valid Email';
    }
    return null;
  }

  // Validates the phone number format.
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Field is required';
    } else if (!AppRegex.isPhoneNumberValid(value)) {
      return 'Please Enter valid Phone';
    }
    return null;
  }

  /// Validates the password to ensure it meets specific criteria.
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Field is required';
    }
    if (!AppRegex.passHasMinLength(value)) {
      return 'Password must be at least 8 characters';
    }
    if (!AppRegex.hasUpperCase(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!AppRegex.hasLowerCase(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!AppRegex.hasNumber(value)) {
      return 'Password must contain at least one number';
    }
    if (!AppRegex.hasSpecialCharacter(value)) {
      return 'Password must contain at least one special character';
    }
    return null; // Password is valid
  }

  static String? validateConfirmPassword(
      String? confirmPassword, String? password) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'This Field is required';
    }
    if (password == null || password.isEmpty) {
      return 'Password Field is required';
    }
    if (confirmPassword != password) {
      return 'Passwords don\'t match';
    }
    return null; // Confirm password is valid
  }
}
