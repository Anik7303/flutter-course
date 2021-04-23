import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'round_icon_button.dart';

class ReusableNumberCard extends StatelessWidget {
  final String title;
  final int value;
  final Function onIncrease;
  final Function onDecrease;

  const ReusableNumberCard({
    Key key,
    @required this.title,
    @required this.value,
    @required this.onIncrease,
    @required this.onDecrease,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          this.title,
          style: kLabelTextStyle,
        ),
        Text(
          this.value.toString(),
          style: kNumberTextStyle,
        ),
        Row(
          children: [
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: onDecrease,
            ),
            SizedBox(width: 10.0),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: onIncrease,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        )
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
