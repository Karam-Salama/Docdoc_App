// validation.dart

import 'package:doc_doc/core/helpers/app_regex.dart';
import 'package:email_validator/email_validator.dart';

class Validation {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Field is required';
    }
    return null;
  }

  /// Validates the email format.
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Field is required';
    } else if (!EmailValidator.validate(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Validates the phone number format.
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Field is required';
    } else if (!AppRegex.isPhoneNumberValid(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  /// Validates the password to ensure it meets specific criteria.
  static String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  }
  if (!AppRegex.hasMinLength(value)) {
    return 'Password cannot be less than 8 characters';
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

}
