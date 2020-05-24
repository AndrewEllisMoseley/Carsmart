import 'package:app/blocs/authentication/authentication.dart';
import 'package:app/blocs/forgot_password/forgot_password.dart';
import 'package:app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'forgot_password.dart';

class AuthForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = RepositoryProvider.of<AuthenticationService>(context);
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);

    return Container(
      child: BlocProvider<ForgotPasswordBloc>(
        create: (context) => ForgotPasswordBloc(authBloc, authService),
        child: ForgotPasswordForm(),
      ),
    );
  }
}
