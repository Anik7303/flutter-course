import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/anik_mohammad.jpg'),
                radius: 50.0,
              ),
              Text(
                'Anik Mohammad',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
