import 'package:flutter/material.dart';

abstract class ProjectStrings {
  static const String materialTitle = "Notes App";
  static const String easyLocalizationPath = 'lib/assets/translations';

  // Translation Constants

  static const String title = 'title';
  static const String emptyTaskList = 'empty_task_list_text';
  static const String addTask = 'add_task';
  static const String emptySearchList = 'empty_search_list';
  static const String emptyTextfieldException =
      'empty_textfield_exception_text';
  static const String searchBar = 'search_text';

  // App Languages

  static const List<Locale> translationsList = [
    Locale('en', 'US'),
    Locale('tr', 'TR'),
  ];
}
