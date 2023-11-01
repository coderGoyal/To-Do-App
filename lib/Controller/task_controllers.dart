import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../Model/task_model.dart';

class TaskController extends GetxController {


  late RxList<Task> tasks;

  @override
  void onInit() {
    super.onInit();
    tasks = Hive.box<Task>('tasks').values.toList().obs;

  }

  void addTask(String title) {
    final task = Task(title, false);
    tasks.add(task);
    Hive.box<Task>('tasks').add(task);
  }

  void toggleTaskStatus(int index) {
    tasks[index].isCompleted = !tasks[index].isCompleted;
    tasks.refresh();
  }

  void editTask(int index, String newTitle) {
    tasks[index].title = newTitle;
    tasks.refresh();
  }

  void deleteTask(int index) {
    Hive.box<Task>('tasks').deleteAt(index);
    tasks.removeAt(index);
  }





}


