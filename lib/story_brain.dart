import 'story.dart';

class StoryBrain {
  int _currentStory = 0;

  List<Story> _stories = [
    Story(
        story:
            'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
        choice1: 'I\'ll hop in. Thanks for the help!',
        choice2: 'Better ask him if he\'s a murderer first.'),
    Story(
        story: 'He nods slowly, unphased by the question.',
        choice1: 'At least he\'s honest. I\'ll climb in.',
        choice2: 'Wait, I know how to change a tire.'),
    Story(
        story:
            'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        choice1: 'I love Elton John! Hand him the cassette tape.',
        choice2: 'It\'s him or me! You take the knife and stab him.'),
    Story(
        story:
            'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        choice1: 'Restart',
        choice2: ''),
    Story(
        story:
            'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        choice1: 'Restart',
        choice2: ''),
    Story(
        story:
            'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        choice1: 'Restart',
        choice2: '')
  ];

  String getStory() {
    return _stories[_currentStory].story;
  }

  String getChoice1() {
    return _stories[_currentStory].choice1;
  }

  String getChoice2() {
    return _stories[_currentStory].choice2;
  }

  void nextStory(int choiceNumber) {
    switch (_currentStory) {
      case 0:
        _currentStory = choiceNumber == 1 ? 2 : 1;
        break;
      case 1:
        _currentStory = choiceNumber == 1 ? 2 : 3;
        break;
      case 2:
        _currentStory = choiceNumber == 1 ? 5 : 4;
        break;
      case 3:
      case 4:
      case 5:
      default:
        reset();
    }
  }

  bool shouldShowChoice2() {
    return _currentStory == 0 || _currentStory == 1 || _currentStory == 2;
  }

  void reset() {
    _currentStory = 0;
  }
}
