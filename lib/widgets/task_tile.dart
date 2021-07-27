import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool ischecked;
  final String? taskTitle;
  final Function checkboxState;
  final Function longpressCallback;
  TaskTile(
      {required this.ischecked,
      required this.taskTitle,
      required this.checkboxState,
      required this.longpressCallback});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        longpressCallback();
      },
      title: Text(
        taskTitle!,
        style: TextStyle(
            decoration: ischecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: ischecked,
        onChanged: (newValue) {
          checkboxState(newValue);
        },
      ),
    );
  }
}
