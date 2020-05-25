import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/blocs.dart';
import 'auth_form.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          minimum: const EdgeInsets.all(16),
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              print('did the page get called?');
              final authBloc = BlocProvider.of<AuthenticationBloc>(context);

              // ignore_for_file: unused_element
              void dispose() {
                authBloc.close();
              }

              if (state is AuthenticationNotAuthenticated ||
                  state is AuthenticationRegister) {
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
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              );
            },
          )),
    );
  }
}
