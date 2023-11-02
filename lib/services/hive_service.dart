import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app_demo/model/task_model.dart';

class HiveService {
  Future startHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TaskModelAdapter());
    Box<TaskModel> taskbox = await Hive.openBox<TaskModel>('tasks');

    for (var element in taskbox.values) {
      if (element.taskTime.day != DateTime.now().day) {
        taskbox.delete(element.taskId);
      }
    }
  }
}
