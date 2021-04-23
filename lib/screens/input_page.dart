import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/reusable_icon_button.dart';
import 'package:bmi_calculator/components/reusable_number_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  double height = 180.0;
  int weight = 60;
  int age = 18;

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
                child: ReusableCard(
                  child: ReusableNumberCard(
                    value: this.weight,
                    title: 'WEIGHT',
                    onIncrease: () {
                      setState(() {
                        this.weight++;
                      });
                    },
                    onDecrease: () {
                      setState(() {
                        this.weight--;
                        this.weight = this.weight < 0 ? 0 : this.weight;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  child: ReusableNumberCard(
                    title: 'AGE',
                    value: this.age,
                    onIncrease: () {
                      setState(() {
                        this.age++;
                      });
                    },
                    onDecrease: () {
                      setState(() {
                        this.age--;
                        this.age = this.age < 1 ? 1 : this.age;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        BottomButton(
          onTap: () {
            CalculatorBrain calc =
                CalculatorBrain(height: this.height, weight: this.weight);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultsPage(
                  bmi: calc.calculateBMI(),
                  interpretation: calc.getInterpretation(),
                  result: calc.getResult(),
                ),
              ),
            );
            // Navigator.pushNamed(context, 'results');
          },
          title: 'Calculate',
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }
}
