import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  final ThemeData theme = ThemeData.dark().copyWith(
    primaryColor: Color(0xFF0A0E21),
    scaffoldBackgroundColor: Color(0xFF0A0E21),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: SafeArea(
          child: InputPage(),
        ),
      ),
      routes: {
        'home': (context) => InputPage(),
        'results': (context) => ResultsPage(),
      },
      title: 'BMI Calculator',
      theme: this.theme,
    );
  }
}
