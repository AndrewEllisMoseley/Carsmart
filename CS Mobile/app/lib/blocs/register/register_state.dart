import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterFirstPage extends RegisterState {}

class RegisterSecondPage extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String error;

  RegisterFailure({@required this.error});

  @override
  List<Object> get props => [error];
}

// Fired when a user has successfully completed part one of registration
class RegisterPartOneComplete extends RegisterState {}

// Fired when a user has successfully completed part two of registration
class RegisterPartTwoComplete extends RegisterState {}

class RegisterToLogin extends RegisterState {}
