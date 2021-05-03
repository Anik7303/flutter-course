import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class Data extends ChangeNotifier {
  List<Task> _tasks = [
    Task(title: 'Buy milk', isDone: true),
    Task(title: 'Buy eggs'),
  ];

  UnmodifiableListView get tasks => UnmodifiableListView(_tasks);

  Task getTask({index}) {
    return _tasks[index];
  }

  // get tasks => _tasks;

  // set tasks(List<Task> updatedTasks) => List.from(updatedTasks);

  // set tasks(List<Task> updatedTasks) {
  //   _tasks = List.from(updatedTasks);
  // }

  int get taskCount => _tasks.length;

  // int getTasksCount() {
  //   return _tasks.length;
  // }

  // void addTask({title}) {
  //   _tasks.add(Task(title: title));
  //   notifyListeners();
  // }
  //
  // void toggleCheckedState({index}) {
  //   _tasks[index].toggleDone();
  //   notifyListeners();
  // }
  void addTask({title}) {
    List<Task> updatedTasks = List.from(_tasks);
    updatedTasks.add(Task(title: title));
    _tasks = updatedTasks;
    notifyListeners();
  }

  void toggleCheckedState({index}) {
    List<Task> updateTasks = List.from(_tasks);
    updateTasks[index].toggleDone();
    _tasks = updateTasks;
    notifyListeners();
  }
}
