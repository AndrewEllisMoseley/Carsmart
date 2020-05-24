import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class ForgotPasswordEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ForgotPasswordEventButtonPressed extends ForgotPasswordEvent {
  final String email;

  ForgotPasswordEventButtonPressed({@required this.email});

  @override
  List<Object> get props => [email];
}

class UserBackToLogin extends ForgotPasswordEvent {}
