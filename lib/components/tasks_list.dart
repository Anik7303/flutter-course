import 'package:flutter/material.dart';
import 'package:todoey/components/task_tile.dart';
import 'package:todoey/models/task.dart';

class TasksList extends StatefulWidget {
  final List<Task> list;

  TasksList({
    Key key,
    @required this.list,
  }) : super(key: key);

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          title: this.widget.list[index].title,
          checked: this.widget.list[index].isDone,
          toggleCheckedState: (checkboxState) {
            setState(() {
              widget.list[index].toggleDone();
            });
          },
        );
      },
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      itemCount: this.widget.list.length,
    );
  }
}
