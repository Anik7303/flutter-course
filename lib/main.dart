import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'QuizBrain.dart';

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            child: QuizPage(),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  BuildContext _context;
  QuizBrain _quizBrain = QuizBrain();

  Icon correctIcon = Icon(
    Icons.check,
    color: Colors.green,
  );
  Icon wrongIcon = Icon(
    Icons.close,
    color: Colors.red,
  );
  List<Icon> scoreKeeper = [];

  void onAnswer(bool answer) {
    setState(() {
      scoreKeeper.add(_quizBrain.checkAnswer(answer) ? correctIcon : wrongIcon);
      _quizBrain.nextQuestion();
      if (_quizBrain.isFinished()) {
        // TODO: add Alert();
        Alert(
          context: _context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        _quizBrain.resetQuiz();
        scoreKeeper.clear();
      }
    });
  }

  Expanded generateButton({String title, bool value, Color backgroundColor}) {
    return Expanded(
      child: Padding(
        child: TextButton(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          onPressed: () {
            onAnswer(value);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
        padding: EdgeInsets.all(15.0),
      ),
      flex: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    this._context = context;
    return Column(
      children: [
        Expanded(
          child: Padding(
            child: Center(
              child: Text(
                _quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
            padding: EdgeInsets.all(10.0),
          ),
          flex: 5,
        ),
        generateButton(
            backgroundColor: Colors.green, title: 'True', value: true),
        generateButton(
            backgroundColor: Colors.red, title: 'False', value: false),
        Center(
          child: Row(
            children: scoreKeeper,
            mainAxisSize: MainAxisSize.min,
          ),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }
}
