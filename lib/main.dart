import 'package:flutter/material.dart';

import 'input_page.dart';

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
      title: 'BMI Calculator',
      theme: this.theme,
    );
  }
}
