import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/database.dart';
import 'package:todoey/models/task_data.dart';
import 'screens/TasksScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskData>(
          create: (context) => TaskData(),
        ),
      ],
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}

//ChangeNotifierProvider(
//create: (context) => TaskData(),
