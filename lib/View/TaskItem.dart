import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/task_controllers.dart';
import '../Model/task_model.dart';
import 'EditTask.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final int index;
  final TaskController controller = Get.find();

  TaskItem({required this.task, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: task.isCompleted ? Colors.grey : Colors.white,
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(
          task.title,
          style: TextStyle(
            fontSize: 18,
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        leading: Checkbox(
          value: task.isCompleted,
          onChanged: (bool? value) {
            controller.toggleTaskStatus(index);
          },
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.black,
          ),
          onPressed: () {
            controller.deleteTask(index);
          },
        ),
        onTap: () {
          Get.defaultDialog(
            title: 'Edit Task',
            content: EditTask(task: task, index: index),
          );
        },
      ),
    );
  }
}