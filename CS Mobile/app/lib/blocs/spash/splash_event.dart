import 'package:equatable/equatable.dart';

abstract class SplashEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UserSplashToLogin extends SplashEvent {}

class UserSplashToRegister extends SplashEvent {}
