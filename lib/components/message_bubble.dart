import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  static const double RADIUS = 100.0;
  final String text;
  final String sender;
  final bool alignLeft;

  MessageBubble({
    @required this.text,
    @required this.sender,
    this.alignLeft = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:
            this.alignLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Text(
            sender,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 12.0,
            ),
          ),
          Material(
            color: this.alignLeft ? Colors.white : Colors.lightBlueAccent,
            child: Padding(
              child: Text(
                '$text',
                style: TextStyle(
                  color: this.alignLeft ? Colors.black : Colors.white,
                  fontSize: 15.0,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            ),
            elevation: 5.0,
            borderRadius: BorderRadius.only(
              topLeft: this.alignLeft ? Radius.zero : Radius.circular(RADIUS),
              topRight: this.alignLeft ? Radius.circular(RADIUS) : Radius.zero,
              bottomLeft: Radius.circular(RADIUS),
              bottomRight: Radius.circular(RADIUS),
            ),
          ),
        ],
      ),
    );
  }
}
