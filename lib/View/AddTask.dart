import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/task_controllers.dart';


class AddTask extends StatelessWidget {
  final TaskController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final TextEditingController taskController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: taskController,
              decoration: const InputDecoration(
                labelText: 'New Task',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: (){
            if (taskController.text.isNotEmpty) {
              controller.addTask(taskController.text);
              taskController.clear();
            }
          },
            child: const Icon(Icons.add,color: Colors.white,),
          )
        ],
      ),
    );
  }
}

