import 'package:app/blocs/authentication/authentication.dart';
import 'package:app/styles/styles.dart';
import 'package:app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'auth_form.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          minimum: const EdgeInsets.all(16),
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              final authBloc = BlocProvider.of<AuthenticationBloc>(context);

              // ignore_for_file: unused_element
              void dispose() {
                authBloc.close();
              }

              if (state is AuthenticationNotAuthenticated ||
                  state is AuthenticationForgotPassword) {
                return AuthForm();
              }
              if (state is AuthenticationFailure) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(state.message),
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text('Retry'),
                      onPressed: () {
                        authBloc.add(AppLoaded());
                      },
                    )
                  ],
                ));
              }
              // return splash screen
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SpinKitFoldingCube(
                      color: kSecondaryColour,
                      size: 100.0,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    CustomText(
                      text: 'Building the page...',
                      fontSize: 20.0,
                      textColour: kTertiaryColour,
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
