import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  const RoundIconButton(
      {Key key, @required this.icon, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        height: 46.0,
        width: 46.0,
      ),
      elevation: 0.0,
      fillColor: kRoundButtonFillColor,
      onPressed: onPressed,
      shape: CircleBorder(),
    );
  }
}
