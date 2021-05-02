import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/components/task_tile.dart';
import 'package:todoey/models/data.dart';
import 'package:todoey/models/task.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        Task task = Provider.of<Data>(context).getTask(index: index);
        return TaskTile(
          title: task.title,
          checked: task.isDone,
          toggleCheckedState: (checkboxState) {
            Provider.of<Data>(
              context,
              listen: false,
            ).toggleCheckedState(index: index);
          },
        );
      },
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      itemCount: Provider.of<Data>(context).getTasksCount(),
    );
  }
}
