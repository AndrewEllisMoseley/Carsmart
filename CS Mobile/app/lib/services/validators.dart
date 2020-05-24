class Validatiors {
  String validateEmail(email) {
    if (email.isEmpty || !matchesEmailRegEx(email)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static bool matchesEmailRegEx(String email) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  String validatePassword(password) {
    //TODO Remove after testing
    if (password == 'SU') {
      return null;
    }
    if (password.isEmpty || !matchesPasswordRegEx(password)) {
      return 'This password is not secure enough, it needs to be \n8 characters or more and use at least one letter \nand one digit';
    }
    return null;
  }

  static bool matchesPasswordRegEx(String password) =>
      RegExp(r"^(?=.*[A-Za-z])(?=.*\d).{8,}$").hasMatch(password);

  String validateName(name) {
    if (name.isEmpty || !matchesNameRegEx(name)) {
      return 'Please enter a valid name';
    }
    return null;
  }

  static bool matchesNameRegEx(String name) =>
      RegExp(r"^[A-Za-z][A-Za-z-\s]+$").hasMatch(name);
}

Validatiors validatiors = new Validatiors();
