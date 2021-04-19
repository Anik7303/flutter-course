import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;

  const ReusableCard({Key key, this.backgroundColor, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.child,
      decoration: BoxDecoration(
        color: this.backgroundColor != null
            ? this.backgroundColor
            : Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.all(15.0),
    );
  }
}
