//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter/material.dart';
//import 'package:todoey/models/task.dart';
//import 'dart:convert';
//import 'package:todoey/models/task_data.dart';
//
//TaskData taskData = TaskData();
//
//class DataBase {
//  SharedPreferences sharedPreferences;
//
//  initSp() async {
//    sharedPreferences = await SharedPreferences.getInstance();
//
//    return sharedPreferences;
//  }
//
//  void saveData() {
//    List<String> spList =
//        taskData.task.map((item) => jsonEncode(item.toMap())).toList();
//    sharedPreferences.setStringList('list', spList);
//    print(spList);
//  }
//
//  void loadData() {
//    List<String> sPList = sharedPreferences.getStringList('list') ?? [];
//    taskData.task =
//        sPList.map((item) => Task.fromMap(jsonDecode(item))).toList();
//  }
//}
