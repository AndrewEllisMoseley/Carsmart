import 'package:app/blocs/authentication/authentication.dart';
import 'package:app/blocs/register/register.dart';
import 'package:app/pages/register/register_form.dart';
import 'package:app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = RepositoryProvider.of<AuthenticationService>(context);
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);

    return Container(
      alignment: Alignment.center,
      child: BlocProvider<RegisterBloc>(
        create: (context) => RegisterBloc(authBloc, authService),
        child: RegisterForm(),
      ),
    );
  }
}
