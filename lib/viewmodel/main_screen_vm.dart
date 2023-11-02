import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:notes_app_demo/constants/constants.dart';
import 'package:notes_app_demo/model/task_model.dart';
import 'package:notes_app_demo/storage/hive_storage.dart';
import 'package:notes_app_demo/widgets/custom_datepicker.dart';
import 'package:notes_app_demo/widgets/custom_textfield.dart';

class MainScreenVm extends ChangeNotifier {
  List<TaskModel> taskList = [];

  HiveLocalStorage hiveLocalStorage = HiveLocalStorage();
  TextEditingController searchController = TextEditingController();
  BuildContext context;

  String taskName = '';
  DateTime taskDate = DateTime.now();

  MainScreenVm({required this.context}) {
    getAllTaskFromDb();
  }

  openModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CustomTextfield(
          onUserSubmitted: (userInput) =>
              checkUserValueIsEmptyOrShort(userInput, context),
        );
      },
    );
  }

  checkUserValueIsEmptyOrShort(String userInputText, BuildContext context) {
    if (userInputText.isNotEmpty && userInputText.length > 4) {
      Navigator.pop(context);
      customTimePicker(
        context,
        (selectedTime) {
          getUserTaskDetailAndAddToList(
              currentTaskName: userInputText, currentTaskDate: selectedTime);
        },
      );
    } else {
      Fluttertoast.showToast(msg: ProjectStrings.emptyTextfieldException.tr());
    }
  }

  getUserTaskDetailAndAddToList(
      {required String currentTaskName,
      required DateTime currentTaskDate}) async {
    taskName = currentTaskName;
    taskDate = currentTaskDate;

    TaskModel currentTask =
        TaskModel.createTaskWithRandomId(taskName, taskDate);

    taskList.insert(0, currentTask);

    addTaskToDb(currentTask);
    notifyListeners();
  }

  removeTaskFromList(int index) {
    taskList.removeAt(index);

    notifyListeners();
  }

  changeCompletedStatus(TaskModel task) async {
    task.isCompleted = !task.isCompleted;
    await hiveLocalStorage.updateTask(task: task);
    notifyListeners();
  }

  //Database Functions

  getAllTaskFromDb() async {
    taskList = await hiveLocalStorage.getAllTask();

    notifyListeners();
  }

  deleteTaskFromDb(TaskModel task) async {
    await hiveLocalStorage.deleteTask(task: task);
    notifyListeners();
  }

  addTaskToDb(TaskModel task) async {
    await hiveLocalStorage.addTask(task: task);
    notifyListeners();
  }
}
