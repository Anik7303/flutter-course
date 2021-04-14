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
          backgroundColor: Colors.red,
          title: Text('Dicee'),
        ),
        backgroundColor: Colors.red,
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              child: Image.asset('images/dice1.png'),
              onPressed: () {
                print('left button pressed');
              },
            ),
            flex: 2,
          ),
          Expanded(
            child: TextButton(
              child: Image.asset('images/dice2.png'),
              onPressed: onDicePress,
            ),
            flex: 2,
          )
        ],
      ),
    );
  }

  void onDicePress() {
    print('dice pressed');
  }
}
