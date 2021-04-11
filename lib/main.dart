import 'package:flutter/cupertino.dart';
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
            // mainAxisSize: MainAxisSize.min,
            // verticalDirection: VerticalDirection.up,
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.white,
                child: Text('Container 1'),
                height: 100.0,
                // margin: EdgeInsets.fromLTRB(20.0, 15.0, 30.0, 35.0),
                // padding: EdgeInsets.all(15.0),
                // width: 100.0,
              ),
              SizedBox(
                height: 10.0,
                width: 20.0,
              ),
              Container(
                child: Text('Container 2'),
                color: Colors.red,
                height: 100.0,
                // width: 100.0,
              ),
              SizedBox(
                height: 10.0,
                width: 20.0,
              ),

              Container(
                child: Text('Container 3'),
                color: Colors.amber,
                height: 100.0,
                // width: 100.0,
              ),
              // Container(
              //   width: double.infinity,
              //   color: Colors.black,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
