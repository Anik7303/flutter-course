import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/message_bubble.dart';
import 'package:flutter/material.dart';

class MessageStream extends StatelessWidget {
  final stream;
  final User loggedInUser;

  MessageStream({
    @required this.stream,
    @required this.loggedInUser,
  });

  int comparseData(first, second) {
    var x = first.data();
    var y = second.data();
    return y['timestamp'].compareTo(x['timestamp']);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: this.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var list = snapshot.data.docs.toList();
          list.sort(comparseData);

          List<MessageBubble> messageBubbles = [];

          for (var message in list) {
            messageBubbles.add(MessageBubble(
              text: message['text'],
              sender: message['sender'],
              alignLeft: message['sender'] == loggedInUser.email,
            ));
          }

          return Expanded(
            child: ListView(
              children: messageBubbles,
              padding: EdgeInsets.all(10.0),
              reverse: true,
            ),
          );
        }

        return Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.lightBlueAccent,
          ),
        );
      },
    );
  }
}
