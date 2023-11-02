import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String taskId;
  @HiveField(1)
  final String taskText;
  @HiveField(2)
  final DateTime taskTime;
  @HiveField(3)
  bool isCompleted;

  TaskModel(
      {required this.taskId,
      required this.taskText,
      required this.taskTime,
      required this.isCompleted});

  factory TaskModel.createTaskWithRandomId(String taskText, DateTime taskTime) {
    return TaskModel(
        taskId: const Uuid().v1(),
        taskText: taskText,
        taskTime: taskTime,
        isCompleted: false);
  }
}
