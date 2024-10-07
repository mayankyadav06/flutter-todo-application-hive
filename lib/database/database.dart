import 'package:hive_flutter/hive_flutter.dart';

class TaskItDatabase {
  List todoList = [];

  //   List todoList = [
  //   ["task 1", false],
  // ];

  final _tasksBox = Hive.box('tasks');

  void initialData() {
    todoList = [
      ["task 1", false],
    ];
  }

  void loadData() {
    todoList = _tasksBox.get('todolist');
  }

  void updateData() {
    _tasksBox.put('todolist', todoList);
  }
}
