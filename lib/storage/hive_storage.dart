import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_app_demo/model/task_model.dart';
import 'package:notes_app_demo/storage/local_storage.dart';

class HiveLocalStorage extends LocalStorage with ChangeNotifier {
  late Box<TaskModel> taskBox;

  HiveLocalStorage() {
    taskBox = Hive.box<TaskModel>('tasks');
  }

  @override
  Future<void> addTask({required TaskModel task}) async {
    await taskBox.put(task.taskId, task);
  }

  @override
  Future<List<TaskModel>> getAllTask() async {
    List<TaskModel> currentTaskList = [];
    currentTaskList = taskBox.values.toList();

    if (currentTaskList.isNotEmpty) {
      currentTaskList
          .sort((TaskModel a, TaskModel b) => a.taskTime.compareTo(b.taskTime));
    }

    return currentTaskList;
  }

  @override
  Future<TaskModel?> getTaskById({required String taskId}) async {
    if (taskBox.containsKey(taskId)) {
      return taskBox.get(taskId);
    }
    return null;
  }

  @override
  Future<bool> deleteTask({required TaskModel task}) async {
    await task.delete();
    return true;
  }

  @override
  Future<TaskModel> updateTask({required TaskModel task}) async {
    await task.save();
    return task;
  }
}
