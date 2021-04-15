import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Ask Me Anything'),
        backgroundColor: Colors.blue.shade800,
      ),
      body: AskMe(),
      backgroundColor: Colors.blue,
    ));
  }
}

class AskMe extends StatefulWidget {
  @override
  _AskMeState createState() => _AskMeState();
}

class _AskMeState extends State<AskMe> {
  int ballNo = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: TextButton(
            child: Image.asset('images/ball$ballNo.png'),
            onPressed: () {
              setState(() {
                ballNo = Random().nextInt(5) + 1;
              });
            },
          ),
        ),
      ],
    );
  }
}
