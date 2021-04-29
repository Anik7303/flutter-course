import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/components/rounded_text_field.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
              tag: 'logo',
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedTextField(
              onChanged: (value) {
                _email = value;
              },
              hint: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 8.0,
            ),
            RoundedTextField(
              onChanged: (value) {
                _password = value;
              },
              hint: 'Password',
              obscureText: true,
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              color: Colors.blueAccent,
              onPressed: () {
                print('email: $_email | password: $_password');
              },
              title: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
