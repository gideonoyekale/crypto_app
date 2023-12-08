extension ValidationExtension on String {
  String? validateFieldNotEmpty() => isEmpty ? 'Required' : null;

  // String? validateFieldNotNull() => this == null ? 'Required' : null;

  String? validateFullName() {
    // if (this == null) return 'Please fill in this field';

    if (isEmpty) return 'Please fill in this field';

    if (split(' ').length < 2) return 'Please enter your FULL NAME';
    return null;
  }

  String? validateEmailAddress() {
    // if (value == null) return 'Please fill in this field';

    if (isEmpty) return 'Required';

    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);

    return !emailValid ? 'Invalid email address' : null;
  }

  String? validatePhoneNumber() {
    // if (value == null) return 'Required';

    if (isEmpty) return 'Required';

    bool phoneNumberValid = isNumber(this);

    return !phoneNumberValid
        ? 'Please check correct phone number format'
        : null;
  }

  bool isNumber(String item) {
    bool value = true;
    item.split('').forEach((e) {
      if (!('0123456789'.contains(e))) value = false;
    });
    return value;
  }

  String? validatePassword({String? confirmPassword}) {
    final digitRegEx = RegExp(r'[0-9]');
    final letterRegEx = RegExp(r'[a-zA-Z]');
    if (isEmpty) {
      return 'Required';
    }
    if (!digitRegEx.hasMatch(this)) {
      return 'Password must have at least one digit';
    }
    if (!letterRegEx.hasMatch(this)) {
      return 'Password must have at least one letter';
    }
    if (length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (confirmPassword != null && this != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  bool _isStringOnlyLetters(String str) {
    return str.trim().isNotEmpty &&
        str.split('').every((char) => RegExp(r'^[a-zA-Z]+$').hasMatch(char));
  }
}
