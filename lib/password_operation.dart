class PasswordOperation {
  bool hasUppercase = false;
  bool hasLowercase = false;
  bool hasSpecialCharacters = false;
  bool hasMinLength = false;
  bool hasDigits = false;

  bool isPasswordCompliant(String? password, [int minLength = 8]) {
    if (password == null || password.isEmpty) {
      return false;
    }

    hasUppercase = password.contains(RegExp(r'[A-Z]'));
    hasDigits = password.contains(RegExp(r'[0-9]'));
    hasLowercase = password.contains(RegExp(r'[a-z]'));
    hasSpecialCharacters =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    hasMinLength = password.length >= minLength;

    return hasDigits &
        hasUppercase &
        hasLowercase &
        hasSpecialCharacters &
        hasMinLength;
  }
}
