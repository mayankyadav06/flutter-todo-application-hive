import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onAdd;
  DialogBox({super.key, required this.controller, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.cyan[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        width: 200.0,
        height: 280.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                autofocus: true,
                controller: controller,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors
                            .black), // Set the border color to black when enabled
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors
                            .black), // Set the border color to black when focused
                  ),
                  hintText: "New Task",
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .black), // Set the border color to black when enabled
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .black), // Set the border color to black when focused
                    ),
                    hintText: "Description"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.cyan),
                      ),
                      onPressed: onAdd,
                      child: const Text(
                        'Add',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.cyan),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
