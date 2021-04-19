import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'resizable_card.dart';
import 'reusable_icon_button.dart';

const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomButtonColor = Color(0xFFEB1555);
const bottomButtonHeight = 80.0;
const cardTextColor = Color(0xFF8D8E98);

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  void updateCardColor(Gender choice) {
    switch (choice) {
      case Gender.Male:
        maleCardColor = maleCardColor == activeCardColor
            ? inactiveCardColor
            : activeCardColor;
        femaleCardColor = inactiveCardColor;
        break;
      case Gender.Female:
        maleCardColor = inactiveCardColor;
        femaleCardColor = femaleCardColor == inactiveCardColor
            ? activeCardColor
            : inactiveCardColor;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  child: ReusableCard(
                    backgroundColor: maleCardColor,
                    child: ReusableIconButton(
                      icon: FontAwesomeIcons.mars,
                      text: 'MALE',
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      updateCardColor(Gender.Male);
                    });
                  },
                ),
              ),
              Expanded(
                child: GestureDetector(
                  child: ReusableCard(
                    backgroundColor: femaleCardColor,
                    child: ReusableIconButton(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      updateCardColor(Gender.Female);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReusableCard(),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(),
              ),
              Expanded(
                child: ReusableCard(),
              ),
            ],
          ),
        ),
        Container(
          color: bottomButtonColor,
          height: bottomButtonHeight,
          margin: const EdgeInsets.only(top: 15.0),
          width: double.infinity,
        )
      ],
    );
  }
}
