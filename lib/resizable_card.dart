import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;
  final Function onTap;

  const ReusableCard({Key key, this.backgroundColor, this.child, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: this.child,
        decoration: BoxDecoration(
          color: this.backgroundColor != null
              ? this.backgroundColor
              : Color(0xFF1D1E33),
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(15.0),
      ),
      onTap: this.onTap,
    );
  }
}
