import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ReusableIconButton extends StatelessWidget {
  final double fontSize;
  final IconData icon;
  final double iconSize;
  final String text;
  final Color textColor;

  const ReusableIconButton(
      {Key key,
      this.fontSize,
      @required this.icon,
      this.iconSize,
      @required this.text,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(this.icon, size: this.iconSize != null ? this.iconSize : 60.0),
        SizedBox(height: 15.0),
        Text(
          this.text,
          style: kLabelTextStyle,
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
