import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return TaskTile(
            taskTitle: taskData.task[index].name,
            checkboxState: (checkboxState) {
              taskData.updateTask(taskData.task[index]);
            },
            longpressCallback: () {
              taskData.deleteTask(taskData.task[index]);
            },
            ischecked: taskData.task[index].isDone,
          );
        },
        itemCount: taskData.tasklength,
      );
    });
  }
}
