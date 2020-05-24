import 'package:app/blocs/login/login.dart';
import 'package:app/services/validators.dart';
import 'package:app/styles/styles.dart';
import 'package:app/wigets/custom_button.dart';
import 'package:app/wigets/custom_link.dart';
import 'package:app/wigets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginForm extends StatefulWidget with Validatiors {
  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    final _loginBloc = BlocProvider.of<LoginBloc>(context);

    _onLoginButtonPressed() {
      if (_key.currentState.validate()) {
        _loginBloc.add(LoginInWithEmailButtonPressed(
            email: _emailController.text, password: _passwordController.text));
      } else {
        setState(() {
          _autoValidate = true;
        });
      }
    }

    _userToRegister() {
      _loginBloc.add(UserToRegister());
    }

    _userToForgotPassword() {
      _loginBloc.add(UserToForgotPassword());
    }

    // ignore_for_file: unused_element
    void dispose() {
      _loginBloc.close();
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          _showError(state.error);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoginLoading) {
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
                    text: 'Let\'s get started!',
                    fontSize: 20.0,
                    textColour: kTertiaryColour,
                    alignment: Alignment.center,
                  ),
                ],
              ),
            );
          }
          return Form(
            key: _key,
            autovalidate: _autoValidate,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(30.0, 100.0, 30.0, 60.0),
                    child: Image.asset('lib/assets/logo-v1.png'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                      color: kPrimaryColour,
                      fontFamily: 'Raleway',
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomText(
                    text: 'Enter to following details to get access.',
                  ),
                  Divider(
                    color: kGreyText,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: kTextFieldInputDecoration(
                      'Enter Email:',
                      '  your@email.com',
                      Icon(
                        FontAwesomeIcons.at,
                        size: 20.0,
                      ),
                      fontWeight: FontWeight.normal,
                    ),
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    validator: validatiors.validateEmail,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: kTextFieldInputDecoration(
                      'Enter password:',
                      '  I won\'t look, honest!',
                      Icon(
                        FontAwesomeIcons.key,
                        size: 20.0,
                      ),
                      fontWeight: FontWeight.normal,
                    ),
                    obscureText: true,
                    controller: _passwordController,
                    validator: validatiors.validatePassword,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      CustomLink(
                        textOne: '',
                        textTwo: 'Forgot password?',
                        redirect: _userToForgotPassword,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    text: 'LOGIN',
                    onPressCallback:
                        state is LoginLoading ? () {} : _onLoginButtonPressed,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomLink(
                    textOne: 'Don\'t have an account? ',
                    textTwo: 'Register for one!',
                    redirect: _userToRegister,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showError(String error) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(error),
      backgroundColor: Theme.of(context).errorColor,
    ));
  }
}
