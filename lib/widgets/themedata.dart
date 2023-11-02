import 'package:flutter/material.dart';
import 'package:notes_app_demo/constants/colors.dart';

ThemeData customThemeData() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: ProjectColors.blueColor,
      ),
      backgroundColor: ProjectColors.transparentColor,
      centerTitle: false,
      elevation: 0,
    ),
  );
}
