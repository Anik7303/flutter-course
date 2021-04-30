import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/message_stream.dart';
import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController messageTextController = TextEditingController();

  bool _loading = false;
  User _loggedInUser;
  String _message;

  void getCurrentUser() {
    try {
      _loggedInUser = _auth.currentUser;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _loading = false;
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: null,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () async {
                  setState(() {
                    _loading = true;
                  });
                  await _auth.signOut();
                  setState(() {
                    _loading = false;
                  });
                  Navigator.pop(context);
                  // getMessageStream();
                }),
          ],
          title: Text('⚡️Chat'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MessageStream(
                stream: _firestore.collection('messages').snapshots(),
                loggedInUser: _loggedInUser,
              ),
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: messageTextController,
                        onChanged: (v) => _message = v,
                        decoration: kMessageTextFieldDecoration,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        messageTextController.clear();
                        _firestore.collection('messages').add({
                          'timestamp': DateTime.now(),
                          'sender': _loggedInUser.email,
                          'text': _message,
                        });
                      },
                      child: Text(
                        'Send',
                        style: kSendButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      inAsyncCall: _loading,
    );
  }
}
