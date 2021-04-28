import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final Color color;

  const AuthButton({
    Key key,
    this.color = Colors.blueAccent,
    @required this.onPressed,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: this.color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: this.onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            this.title,
          ),
        ),
      ),
    );
  }
}
