import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../Controller/task_controllers.dart';
import 'AddTask.dart';
import 'TaskList.dart';


class HomePage extends StatelessWidget {
  final TaskController controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0.0,
          title: const Text(
            'To-Do App',
            style: TextStyle(fontSize: 28, color: Colors.white,fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            AddTask(),
            Expanded(child: TaskList()),
          ],
        ),
      ),
    );
  }
}
