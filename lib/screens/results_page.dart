import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String bmi;
  final String interpretation;
  final String result;

  ResultsPage({Key key, this.bmi, this.interpretation, this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text('Your Result', style: kTitleTextStyle),
              padding: EdgeInsets.all(15.0),
            ),
          ),
          Expanded(
            child: ReusableCard(
              backgroundColor: kActiveCardColor,
              child: Column(
                children: [
                  Text(this.result.toUpperCase(), style: kResultTextStyle),
                  Text(this.bmi, style: kBmiTextStyle),
                  Text(
                    this.interpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ),
            flex: 5,
          ),
          BottomButton(
            title: 'Re-Calculate',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
    );
  }
}
