import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_application/database/database.dart';
import 'package:todo_application/pages/todo_tile.dart';
import 'package:todo_application/pages/util/dialog_box.dart';

class TodosList extends StatefulWidget {
  const TodosList({super.key});

  @override
  State<TodosList> createState() => _TodosListState();
}

class _TodosListState extends State<TodosList> {
  final _controller = TextEditingController();
  final _tasksBox = Hive.box('tasks');
  TaskItDatabase db = TaskItDatabase();

  @override
  void initState() {
    if (_tasksBox.get('todolist') == null) {
      db.initialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

// To check and uncheck the task
  void onChanged(int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  void onAdd() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

// To add a new task to the list
  void addTaskDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogBox(
          controller: _controller,
          onAdd: onAdd,
        );
      },
    );
  }

  void onDelete(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  void onCompleted(int index) {
    setState(() {
      if (!db.todoList[index][1]) {
        db.todoList[index][1] = !db.todoList[index][1];
        //   Add to list of completed tasks
      } else {
        //   show toast on screen that the task is already marked completed
      }
    });
    db.updateData();
  }

  // void iconCompleted(int index) {
  //   setState(() {
  //     if (!todoList[index][1]) {
  //       todoList[index][1] = !todoList[index][1];
  //       //   Add to list of completed tasks
  //     }
  //   });
  // db.updateData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan[400],
        onPressed: addTaskDialog,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoTile(
            task: db.todoList[index][0],
            isCompleted: db.todoList[index][1],
            onChanged: (value) => onChanged(index),
            onDelete: (value) => onDelete(index),
            onCompleted: (value) => onCompleted(index),
            // onIconCompleted: iconCompleted(index),
          );
        },
      ),
    );
  }
}
