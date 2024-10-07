import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class TodoTile extends StatelessWidget {
// ToDo elements
  final String task;
  final bool isCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext) onDelete;
  Function(BuildContext) onCompleted;
  // Function() onIconCompleted;

  TodoTile({
    super.key,
    required this.task,
    required this.isCompleted,
    required this.onChanged,
    required this.onDelete,
    required this.onCompleted,
    // required this.onIconCompleted
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 18.0),
      child: Slidable(
        enabled: true,
        startActionPane: ActionPane(
          extentRatio: 0.30,
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onCompleted,
              icon: Icons.done,
              backgroundColor: Colors.green,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
              ),
            ),
          ],
        ),
        
        endActionPane: ActionPane(
          extentRatio: 0.30,
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onDelete,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(18.0),
          decoration: BoxDecoration(
              color: Colors.cyan[200],
              borderRadius: BorderRadius.circular(8.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                task, //  ToDo Task
                style: TextStyle(
                    fontSize: 18.0,
                    decoration: isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              Checkbox(
                value: isCompleted, // is the task completed or not
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              // IconButton(
              //     onPressed: onIconCompleted,
              //     icon: Icon(Icons.keyboard_arrow_down))
            ],
          ),
        ),
      ),
    );
  }
}
