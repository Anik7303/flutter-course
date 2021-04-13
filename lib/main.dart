import 'package:flutter/material.dart';

void main() {
  runApp(MiCard());
}

class MiCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/anik.jpg'),
              radius: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
