import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class Data extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> getTasks() {
    return _tasks;
  }

  Task getTask({index}) {
    return _tasks[index];
  }

  int getTasksCount() {
    return _tasks.length;
  }

  void addTask({title}) {
    _tasks.add(Task(title: title));
    notifyListeners();
  }

  void toggleCheckedState({index}) {
    _tasks[index].toggleDone();
    notifyListeners();
  }
}
