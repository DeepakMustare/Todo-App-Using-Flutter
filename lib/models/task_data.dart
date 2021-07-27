import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/screens/TasksScreen.dart';

TasksScreen tasksScreen = TasksScreen();

class TaskData extends ChangeNotifier {
  SharedPreferences? sharedPreferences;
  initSp() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences;
  }

  List<Task> task = [
    Task(name: 'buy milk'),
    Task(name: 'buy bread'),
    Task(name: 'buy cake'),
  ];

  int get tasklength {
    return task.length;
  }

  void addTask(String? newTaskTitle) {
    final tasks = Task(name: newTaskTitle);
    task.add(tasks);

    notifyListeners();
    saveData();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
    saveData();
  }

  void deleteTask(Task tasks) {
    task.remove(task);
    saveData();

    notifyListeners();

    sharedPreferences?.clear();
  }

  void saveData() {
    List<String> spList = task.map((item) => jsonEncode(item.toMap())).toList();

    sharedPreferences?.setStringList('task', spList);
    print(spList);
  }
}
