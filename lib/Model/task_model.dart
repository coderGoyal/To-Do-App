import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late bool isCompleted;

  Task(this.title, this.isCompleted);
}



