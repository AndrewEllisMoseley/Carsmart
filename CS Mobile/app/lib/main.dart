import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/blocs.dart';
import 'services/authentication_service.dart';
import 'services/services.dart';
import 'pages/pages.dart';

void main() => runApp(
        // Injects the Authentication service
        RepositoryProvider<AuthenticationService>(
      create: (context) {
        return AuthService();
      },
      // Injects the Authentication BLoC
      child: BlocProvider<AuthenticationBloc>(
        create: (context) {
          final authService =
              RepositoryProvider.of<AuthenticationService>(context);
          return AuthenticationBloc(authService)..add(AppLoaded());
        },
        child: MyApp(),
      ),
    ));

class MyApp extends StatelessWidget {
  static final _focusNode = FocusNode();
  static int inMinutes;
  static Timer _sessionTimer;
  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);
    return MaterialApp(
      title: 'Carsmart',
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            int userTokenExpiry = state.user.tokenExpiry;
            // show home page
            return GestureDetector(
              onTap: () {
                _timeoutSession(authBloc, userTokenExpiry);
              },
              child: RawKeyboardListener(
                focusNode: _focusNode,
                onKey: (key) =>
                    _rawKeyboardListener(key.data, authBloc, userTokenExpiry),
                child: HomePage(
                  user: state.user,
                ),
              ),
            );
          }
          // show login if selected
          if (state is AuthenticationLogin) {
            return LoginPage();
          }
          // show register if selected
          if (state is AuthenticationRegister) {
            return RegisterPage();
          }

          if (state is AuthenticationForgotPassword) {
            return ForgotPasswordPage();
          }
          // otherwise show splash screen
          return LoginPage();
        },
      ),
    );
  }

  void _rawKeyboardListener(
      RawKeyEventData data, AuthenticationBloc authBloc, int expiry) {
    _timeoutSession(authBloc, expiry);
  }

  void _timeoutSession(authBloc, expiry) {
    if (inMinutes == null) {
      final date = new DateTime.fromMillisecondsSinceEpoch(expiry * 1000);
      final difference = date.difference(new DateTime.now());
      inMinutes = difference.inMinutes;
    }
    _sessionTimer?.cancel();
    // duration reset's to a specific time
    _sessionTimer = new Timer(Duration(minutes: inMinutes), () {
      authBloc.add(UserLoggedOut());
    });
  }
}
