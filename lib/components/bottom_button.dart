import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String title;
  final Function onTap;
  const BottomButton({
    Key key,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Center(
          child: Text(
            this.title,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kBottomButtonColor,
        height: kBottomButtonHeight,
        margin: const EdgeInsets.only(top: 15.0),
        width: double.infinity,
      ),
      onTap: this.onTap,
    );
  }
}
