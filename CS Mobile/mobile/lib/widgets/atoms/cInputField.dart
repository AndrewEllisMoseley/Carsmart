import 'package:flutter/material.dart';
import 'package:mobile/styles/constants.dart';

class CInputField extends StatelessWidget {
  CInputField(
      {@required this.fieldLabel,
      this.fieldPlaceholder,
      this.icon,
      @required this.fieldController,
      @required this.validator});

  final String fieldLabel;
  final String fieldPlaceholder;
  final Icon icon;
  final TextEditingController fieldController;
  final Function validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: usernameController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      // focusNode: userFocus,
      // onFieldSubmitted: (_) {
      //   FocusScope.of(context).requestFocus(passFocus);
      // },
      // validator: (value) => emptyValidation(value),
      decoration: kTextFieldInputDecoration(
        fieldLabel,
        fieldPlaceholder,
        icon,
      ),
    );
  }
}
