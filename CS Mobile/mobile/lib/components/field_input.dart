import 'package:flutter/material.dart';
import 'package:mobile/styles/constants.dart';

class FieldInput extends StatelessWidget {
  FieldInput({@required this.fieldLabel, this.fieldPlaceholder, this.icon});

  final fieldLabel;
  final fieldPlaceholder;
  final Icon icon;

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
