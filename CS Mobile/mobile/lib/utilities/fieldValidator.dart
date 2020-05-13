class FieldValidation {
  // EMAIL VALIDATION
  Function(String) emailValidation = (String email) {
    if (email.isNotEmpty && matchesEmailRegEx(email)) {
      return null;
    }
    return 'Please enter a valid email address';
  };

  static bool matchesEmailRegEx(String email) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

// END OF EMAIL VALIDATION

// PASSWORD VALIDATION
  Function(String) passwordValidation = (String password) {
    //admin password for now
    if (password == 'admin') {
      return null;
    }
    if (password.isNotEmpty && matchesPasswordRegEx(password)) {
      return null;
    }
    return 'This password is not secure enough, it needs to be \n8 characters or more and use at least one letter \nand one digit';
  };

  static bool matchesPasswordRegEx(String password) =>
      RegExp(r"^(?=.*[A-Za-z])(?=.*\d).{8,}$").hasMatch(password);

  //END OF PASSWORD VALIDATION
}
