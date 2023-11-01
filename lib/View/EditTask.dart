import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/task_controllers.dart';
import '../Model/task_model.dart';

class EditTask extends StatelessWidget {
  final Task task;
  final int index;
  final TaskController controller = Get.find();

  EditTask({required this.task, required this.index});

  @override
  Widget build(BuildContext context) {
    final TextEditingController editController =
    TextEditingController(text: task.title);

    return Column(
      children: [
        TextField(
          controller: editController,
          decoration: const InputDecoration(
            labelText: 'Edit Task',
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigo),
            ),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.indigo),
          ),
          onPressed: () {
            if (editController.text.isNotEmpty) {
              controller.editTask(index, editController.text);
              Get.back();
            }
          },
          child: const Text(
            'Save',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}