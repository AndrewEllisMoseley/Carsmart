import 'package:app/blocs/authentication/authentication.dart';
import 'package:app/blocs/login/login.dart';
import 'package:app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login.dart';

class AuthForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = RepositoryProvider.of<AuthenticationService>(context);
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);

    // ignore_for_file: unused_element
    void dispose() {
      authBloc.close();
    }

    return Container(
      child: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(authBloc, authService),
        child: LoginForm(),
      ),
    );
  }
}
