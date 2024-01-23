import 'string.dart';
import 'package:flutter/foundation.dart' show immutable;

//Helpers
//* A utility class that holds methods for validating different textFields.
//* This class has no constructor and all methods are `static`.
@immutable
class FormValidator {
  const FormValidator._();

  //* The error message for invalid email input.
  static const _invalidEmailError = 'Please enter a valid email address';

  //* The error message for empty email input.
  static const _emptyEmailInputError = 'Please enter an email';

  //* The error message for empty password input.
  static const _emptyPasswordInputError = 'Please enter a password';

  //* The error message for invalid confirm password input.
  static const _invalidConfirmPwError = "Passwords don't match";

  //* The error message for invalid current password input.
  static const _invalidCurrentPwError = 'Invalid current password!';

  //* The error message for invalid new password input.
  static const _invalidNewPwError = "Current and new password can't be same";

  //* The error message for invalid name input.
  static const _invalidNameError = 'Please enter a valid name';

  //* The error message for empty address input.
  static const _emptyAddressInputError = 'Please enter a address';

  //* The error message for empty cinema branch input.
  static const _emptyBranchInputError = 'Please enter the branch name';

  //* The error message for invalid contact input.
  static const _invalidContactError = 'Please enter a valid contact';

//* requires of field specific type like int or string;

  static String? fieldValidatorRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return "$fieldName: field is required";
    }
    return null;
  }

  static String? numberValidator(String? value, {bool isRequired = false}) {
    if (!isRequired && (value == null || value.isEmpty)) {
      return null;
    }
    if (isRequired && (value  == null || value.isEmpty)) {
      return 'Field is required';
    }
    if (int.tryParse(value!) == null) {
      return 'Only contain numbers.';
    }
    return null;
  }

  static String? decimalNumberValidator(String? value, {bool isRequired = false}) {
    if (!isRequired && (value == null || value.isEmpty)) {
      return null;
    }
    if (isRequired && (value  == null || value.isEmpty)) {
      return 'Field is required';
    }
    if (double.tryParse(value!) == null) {
      return 'Only contain numbers.';
    }
    return null;
  }


  //* A method containing validation logic for email input.
  static String? emailValidatorRequired(String? email, {bool isRequired = false}) {
    if (!isRequired && (email == null || email.isEmpty)) return null;
    if (email == null || email.isEmpty) {
      return _emptyEmailInputError;
    } else if (!email.isValidEmail) {
      return _invalidEmailError;
    }
    return null;
  }

  //* A method containing validation logic for password input.
  static String? passwordValidatorRequired(String? password) {
    if (password == null || password.isEmpty) {
      return _emptyPasswordInputError;
    }
    return null;
  }


  //* A method containing validation logic for name input.
  static String? nameValidatorRequired(String? name, ) {
    if (name != null && name.isValidName) {
      return null;
    }
    return _invalidNameError;
  }

  //* A method containing validation logic for address input.
  static String? addressValidatorRequired(String? address) {
    if (address == null || address.isEmpty) {
      return _emptyAddressInputError;
    }
    return null;
  }

  //* A method containing validation logic for contact number input.
  static String? contactValidator(String? contact, {bool required = false}) {
    if (!required && contact == null) return null;
    if (contact != null && contact.isValidContact) {
      return null;
    }
    return _invalidContactError;
  }

}