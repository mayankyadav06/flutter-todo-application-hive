import 'package:hive_flutter/hive_flutter.dart';

class TaskItDatabase {
  List todoList = [];

  final _tasksBox = Hive.box('tasks');

  void initialData() {
    todoList = [
      ["Go To Running", false],
    ];
  }

  void loadData() {
    todoList = _tasksBox.get('todolist');
  }

  void updateData() {
    _tasksBox.put('todolist', todoList);
  }
}
