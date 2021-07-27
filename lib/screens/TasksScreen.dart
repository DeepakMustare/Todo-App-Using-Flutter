import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/task_list.dart';
import 'add_tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoey/models/task.dart';

TaskData taskData = TaskData();

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final key = GlobalKey();
  late SharedPreferences sharedPreferences;
  @override
  void initState() {
    initSp();
    super.initState();
  }

  initSp() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      List<String>? sPList = sharedPreferences.getStringList('task');
      print(sPList);

      taskData.task.addAll(
          sPList!.map((item) => Task.fromMap(json.decode(item))).toList());
    });
    print("hii ${taskData.task}");
  }

  void loadData() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddTasksScreen()
//

                      )));
        },
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.list,
                        size: 30.0,
                      )),
                  SizedBox(height: 10.0),
                  Text(
                    'todoey',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '${Provider.of<TaskData>(context).tasklength} Tasks',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TaskList(),
            ))
          ],
        ),
      ),
    );
  }
}
