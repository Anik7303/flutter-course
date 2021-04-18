import 'package:flutter/material.dart';

import 'story_brain.dart';

void main() => runApp(DestiniApp());

class DestiniApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StoryPage(),
      ),
      theme: ThemeData.dark(),
    );
  }
}

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryBrain _storyBrain = StoryBrain();

  Widget getChoiceButton({
    String choice,
    Color backgroundColor,
    Function onPress,
  }) {
    return Expanded(
      child: TextButton(
        child: Text(
          choice,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        onPressed: onPress,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
        ),
      ),
      flex: 1,
    );
  }

  void onAnswer(int choice) {
    setState(() {
      _storyBrain.nextStory(choice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    _storyBrain.getStory(),
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
                flex: 8,
              ),
              getChoiceButton(
                choice: _storyBrain.getChoice1(),
                backgroundColor: Colors.red,
                onPress: () {
                  onAnswer(1);
                },
              ),
              SizedBox(height: _storyBrain.shouldShowChoice2() ? 16.0 : 0.0),
              Visibility(
                child: getChoiceButton(
                  choice: _storyBrain.getChoice2(),
                  backgroundColor: Colors.blue,
                  onPress: () {
                    onAnswer(2);
                  },
                ),
                visible: _storyBrain.shouldShowChoice2(),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          ),
        ),
      ),
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      // padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 50.0),
    );
  }
}
