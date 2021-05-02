import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool checked;
  final Function toggleCheckedState;

  TaskTile({
    Key key,
    this.checked = false,
    @required this.title,
    @required this.toggleCheckedState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        this.title,
        style: TextStyle(
          color: checked ? Colors.grey : Colors.black,
          decoration:
              checked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        value: this.checked,
        fillColor: MaterialStateProperty.all(Colors.lightBlueAccent),
        onChanged: this.toggleCheckedState,
      ),
    );
  }
}
