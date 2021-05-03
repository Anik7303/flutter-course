import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/components/task_tile.dart';
import 'package:todoey/models/data.dart';
import 'package:todoey/models/task.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (context, data, __) => ListView.builder(
        itemBuilder: (context, index) {
          final Task task = data.getTask(index: index);
          return TaskTile(
            onLongPressed: () {
              data.deleteTask(index: index);
            },
            title: task.title,
            checked: task.isDone,
            toggleCheckedState: (checkboxState) {
              data.toggleCheckedState(index: index);
            },
          );
        },
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        itemCount: data.taskCount,
      ),
    );
  }
}
