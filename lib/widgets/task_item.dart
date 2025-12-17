import 'package:flutter/material.dart';
import 'package:task_app/models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final VoidCallback onTap;

  const TaskItem({super.key, required this.task, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isComplete ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Icon(
        task.isComplete ? Icons.check_circle : Icons.check_outlined,
        color: task.isComplete ? Colors.green : Colors.grey,
      ),
      onTap: onTap,
    );
  }
}
