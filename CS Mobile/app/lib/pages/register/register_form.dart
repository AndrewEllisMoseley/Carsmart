import 'package:app/blocs/register/register.dart';
import 'package:app/services/services.dart';
import 'package:app/services/validators.dart';
import 'package:app/styles/styles.dart';
import 'package:app/wigets/custom_button.dart';
import 'package:app/wigets/custom_link.dart';
import 'package:app/wigets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterForm extends StatefulWidget with Validatiors {
  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _companyDropdownValue;
  String _jobDropdownValue;
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    final _registerBloc = BlocProvider.of<RegisterBloc>(context);

    _onContinueOneButtonPressed() {
      if (_key.currentState.validate()) {
        _registerBloc.add(RegisterContinueFirstButtonPressed());
      } else {
        setState(() {
          _autoValidate = true;
        });
      }
    }

    _onContinueTwoButtonPressed() {
      if (_key.currentState.validate()) {
        _registerBloc.add(RegisterContinueSecondButtonPressed());
      } else {
        setState(() {
          _autoValidate = true;
        });
      }
    }

    _onRegisterButtonPressed() {
      if (_key.currentState.validate()) {
        _registerBloc.add(RegisterFullDetailsButtonPressed(
            firstName: _firstNameController.text,
            lastName: _lastNameController.text,
            company: companies.getCompany(_companyDropdownValue),
            job: jobs.getJob(_jobDropdownValue),
            email: _emailController.text,
            password: _passwordController.text));
      } else {
        setState(() {
          _autoValidate = true;
        });
      }
    }

    _userToLogin() {
      _registerBloc.add(UserToLogin());
    }

    // ignore_for_file: unused_element
    void dispose() {
      _registerBloc.close();
    }

    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailure) {
          _showError(state.error);
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          if (state is RegisterLoading) {
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
                    text: 'sit back, relax',
                    fontSize: 20.0,
                    textColour: kTertiaryColour,
                    alignment: Alignment.center,
                  ),
                  CustomText(
                    text: 'We\'re just registering your request',
                    fontSize: 20.0,
                    textColour: kTertiaryColour,
                    alignment: Alignment.center,
                  ),
                ],
              ),
            );
          }

          if (state is RegisterPartTwoComplete) {
            return Form(
              key: _key,
              autovalidate: _autoValidate,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 30.0),
                      child: Image.asset('lib/assets/logo-v1.png'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Register',
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
                        'Enter email:',
                        '  your@email.com',
                        Icon(
                          FontAwesomeIcons.signature,
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
                          FontAwesomeIcons.edit,
                          size: 20.0,
                        ),
                        fontWeight: FontWeight.normal,
                      ),
                      obscureText: true,
                      controller: _passwordController,
                      validator: validatiors.validatePassword,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      text: 'REGISTER',
                      onPressCallback: state is RegisterLoading
                          ? () {}
                          : _onRegisterButtonPressed,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomLink(
                      textOne: 'Already have an account? ',
                      textTwo: 'Why not Login?',
                      redirect: _userToLogin,
                    ),
                  ],
                ),
              ),
            );
          }

          if (state is RegisterPartOneComplete) {
            return Form(
              key: _key,
              autovalidate: _autoValidate,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 30.0),
                      child: Image.asset('lib/assets/logo-v1.png'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Register',
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
                    FormField<String>(
                      builder: (FormFieldState<String> state) {
                        return InputDecorator(
                          decoration: kTextFieldInputDecoration(
                            '  Select company:',
                            null,
                            null,
                            fontWeight: FontWeight.normal,
                          ),
                          isEmpty: _companyDropdownValue == '',
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              hint: Text('Please Select'),
                              value: _companyDropdownValue,
                              isDense: true,
                              onChanged: (String newValue) {
                                setState(() {
                                  _companyDropdownValue = newValue;
                                  state.didChange(newValue);
                                });
                              },
                              items:
                                  companies.getCompanies().map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FormField<String>(
                      builder: (FormFieldState<String> state) {
                        return InputDecorator(
                          decoration: kTextFieldInputDecoration(
                            '  Select job:',
                            null,
                            null,
                            fontWeight: FontWeight.normal,
                          ),
                          isEmpty: _jobDropdownValue == '',
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              hint: Text('Please Select'),
                              value: _jobDropdownValue,
                              isDense: true,
                              onChanged: (String newValue) {
                                setState(() {
                                  _jobDropdownValue = newValue;
                                  state.didChange(newValue);
                                });
                              },
                              items: jobs.getJobs().map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      text: 'NEXT',
                      onPressCallback: state is RegisterLoading
                          ? () {}
                          : _onContinueTwoButtonPressed,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomLink(
                      textOne: 'Already have an account? ',
                      textTwo: 'Why not Login?',
                      redirect: _userToLogin,
                    ),
                  ],
                ),
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
                    margin: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 30.0),
                    child: Image.asset('lib/assets/logo-v1.png'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Register',
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
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: kTextFieldInputDecoration(
                      'Enter first name:',
                      '  john',
                      null,
                      fontWeight: FontWeight.normal,
                    ),
                    controller: _firstNameController,
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    validator: validatiors.validateName,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: kTextFieldInputDecoration(
                      'Enter last name:',
                      '  doe',
                      null,
                      fontWeight: FontWeight.normal,
                    ),
                    controller: _lastNameController,
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    validator: validatiors.validateName,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    text: 'NEXT',
                    onPressCallback: state is RegisterLoading
                        ? () {}
                        : _onContinueOneButtonPressed,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomLink(
                    textOne: 'Already have an account? ',
                    textTwo: 'Why not Login?',
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
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(error),
      backgroundColor: Theme.of(context).errorColor,
    ));
  }
}
