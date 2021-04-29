import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  final String hint;
  final TextInputType keyboardType;
  final Function onChanged;
  final bool obscureText;

  RoundedTextField({
    Key key,
    this.hint,
    this.keyboardType = TextInputType.text,
    @required this.onChanged,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: kTextFieldInputDecorationStyle.copyWith(
        hintText: this.hint,
      ),
      keyboardType: this.keyboardType,
      obscureText: this.obscureText,
      onChanged: this.onChanged,
      style: kTextFieldTextStyle,
      textAlign: TextAlign.center,
    );
  }
}
