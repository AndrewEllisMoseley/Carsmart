import 'package:app/blocs/forgot_password/forgot_password.dart';
import 'package:app/services/validators.dart';
import 'package:app/styles/styles.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:app/widgets/custom_link.dart';
import 'package:app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgotPasswordForm extends StatefulWidget with Validatiors {
  @override
  ForgotPasswordFormState createState() => ForgotPasswordFormState();
}

class ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    final _forgotPasswordBloc = BlocProvider.of<ForgotPasswordBloc>(context);

    _onForgotPasswordButtonPressed() {
      if (_key.currentState.validate()) {
        _forgotPasswordBloc.add(
            ForgotPasswordEventButtonPressed(email: _emailController.text));
      } else {
        setState(() {
          _autoValidate = true;
        });
      }
    }

    _userToLogin() {
      _forgotPasswordBloc.add(UserBackToLogin());
    }

    // ignore_for_file: unused_element
    void dispose() {
      _forgotPasswordBloc.close();
    }

    return BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordFailure) {
          _showError(state.error);
        }
      },
      child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
        builder: (context, state) {
          if (state is ForgotPasswordLoading) {
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
                    text: 'We\'re sending you an email!',
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
                    'Forgot Password',
                    style: TextStyle(
                      color: kPrimaryColour,
                      fontFamily: 'Raleway',
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomText(
                    text:
                        'To reset your password, enter the following details.',
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
                    height: 20.0,
                  ),
                  CustomButton(
                    text: 'RESET',
                    onPressCallback: state is ForgotPasswordLoading
                        ? () {}
                        : _onForgotPasswordButtonPressed,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomLink(
                    textOne: 'Remembered your email? ',
                    textTwo: 'Head over and login!',
                    redirect: _userToLogin,
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
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Container(
          height: 25.0,
          margin: EdgeInsets.all(4.0),
          width: MediaQuery.of(context).size.width * 0.8,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Icon(
              FontAwesomeIcons.exclamationTriangle,
              color: kWhiteText,
              size: 16.0,
            ),
            Text(' ' + error)
          ]),
        ),
        backgroundColor: Theme.of(context).errorColor,
        duration: Duration(seconds: 5),
      ),
    );
  }
}
