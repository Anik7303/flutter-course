import 'package:flash_chat/components/auth_button.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 1),
      // upperBound: 100.0,
      vsync: this,
    );

    // _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceIn);
    // _animation = CurvedAnimation(parent: _controller, curve: Curves.decelerate);

    _animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(_controller);

    _controller.forward();

    // _controller.addListener(updateAnimationValue);
    _animation.addListener(updateAnimationValue);

    // _controller.addStatusListener(updateAnimationStatus);
    // _animation.addStatusListener(updateAnimationStatus);
  }

  void updateAnimationStatus(status) {
    print(status);
    if (status == AnimationStatus.completed) {
      _controller.reverse(from: 1.0);
    } else if (status == AnimationStatus.dismissed) {
      _controller.forward(from: 0.0);
    }
  }

  void updateAnimationValue() {
    setState(() {});
    // print('controller value: ${_controller.value}');
    // print('animation value: ${_animation.value}');
  }

  @override
  void dispose() {
    _animation.removeListener(updateAnimationValue);
    _animation.removeStatusListener(updateAnimationStatus);
    _controller.removeListener(updateAnimationValue);
    _controller.removeStatusListener(updateAnimationStatus);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                  tag: 'logo',
                ),
                Text(
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            AuthButton(
              color: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              title: 'Log In',
            ),
            AuthButton(
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              title: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
