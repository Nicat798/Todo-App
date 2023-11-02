import 'package:notes_app_demo/model/task_model.dart';

abstract class LocalStorage {
  Future<void> addTask({required TaskModel task});
  Future<TaskModel?> getTaskById({required String taskId});
  Future<List<TaskModel>> getAllTask();
  Future<bool> deleteTask({required TaskModel task});
  Future<TaskModel> updateTask({required TaskModel task});
}
