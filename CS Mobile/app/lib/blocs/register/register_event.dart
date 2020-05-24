import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterContinueFirstButtonPressed extends RegisterEvent {}

class RegisterContinueSecondButtonPressed extends RegisterEvent {}

class RegisterFullDetailsButtonPressed extends RegisterEvent {
  final String firstName;
  final String lastName;
  final String company;
  final String job;
  final String email;
  final String password;

  RegisterFullDetailsButtonPressed(
      {@required this.firstName,
      @required this.lastName,
      @required this.company,
      @required this.job,
      @required this.email,
      @required this.password});

  @override
  List<Object> get props =>
      [firstName, lastName, company, job, email, password];
}

class UserToLogin extends RegisterEvent {}
