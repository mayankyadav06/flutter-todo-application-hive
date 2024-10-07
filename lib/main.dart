import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_application/pages/todos_list.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('tasks');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan[400],
          centerTitle: true,
          title: const Text(
            "T A S K I T",
          ),
        ),
        body: const TodosList(),
      ),
    );
  }
}
