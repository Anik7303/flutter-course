import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'resizable_card.dart';
import 'reusable_icon_button.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  double height = 180.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  backgroundColor: selectedGender == Gender.Male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  child: ReusableIconButton(
                    icon: FontAwesomeIcons.mars,
                    text: 'MALE',
                  ),
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.Male;
                    });
                  },
                ),
              ),
              Expanded(
                child: ReusableCard(
                  backgroundColor: selectedGender == Gender.Female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  child: ReusableIconButton(
                    icon: FontAwesomeIcons.venus,
                    text: 'FEMALE',
                  ),
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.Female;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReusableCard(
            child: Column(
              children: [
                Text(
                  'HEIGHT',
                  style: kLabelTextStyle,
                ),
                Row(
                  children: [
                    Text(
                      this.height.toInt().toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: kSliderActiveColor,
                    inactiveTrackColor: kSliderInactiveColor,
                    overlayColor: kSliderOverlayColor,
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    thumbColor: kSliderActiveColor,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  ),
                  child: Slider(
                    value: this.height,
                    onChanged: (newHeight) {
                      setState(() {
                        this.height = newHeight;
                      });
                    },
                    min: kMinHeight,
                    max: kMaxHeight,
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
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
          color: kBottomButtonColor,
          height: kBottomButtonHeight,
          margin: const EdgeInsets.only(top: 15.0),
          width: double.infinity,
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }
}
