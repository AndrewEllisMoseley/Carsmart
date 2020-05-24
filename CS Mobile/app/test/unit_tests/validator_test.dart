import 'package:app/services/validators.dart';
import 'package:test/test.dart';

void main() {
  Validatiors validatiors = new Validatiors();
  group('Validator Class - Email', () {
    test("Should return 'null' for validate email address", () {
      expect(validatiors.validateEmail('test@email.com'), null);
    });

    test("Should return error message for invalid email", () {
      expect(validatiors.validateEmail('test.com'),
          'Please enter a valid email address');
    });
  });

  group('Validator Class - Password', () {
    test("Should return 'null' for validate password", () {
      expect(validatiors.validatePassword('Password101!'), null);
    });

    test("Should return error message for invalid password", () {
      expect(validatiors.validatePassword('P'),
          'This password is not secure enough, it needs to be \n8 characters or more and use at least one letter \nand one digit');
    });
  });

  group('Validator Class - Name', () {
    test("Should return 'null' for validate name", () {
      expect(validatiors.validateName('Frank'), null);
    });

    test("Should return error message for invalid name", () {
      expect(validatiors.validateName('F'), 'Please enter a valid name');
    });
  });
}
