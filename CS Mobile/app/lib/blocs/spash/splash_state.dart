import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {
  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashToLogin extends SplashState {}

class SplashToRegister extends SplashState {}
