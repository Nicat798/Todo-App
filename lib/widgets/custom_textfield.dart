import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:notes_app_demo/constants/constants.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key, required this.onUserSubmitted});

  final Function(String userInput) onUserSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      width: MediaQuery.of(context).size.width,
      child: ListTile(
        title: TextField(
          autofocus: true,
          onSubmitted: (value) => onUserSubmitted(value),
          decoration: InputDecoration(
            hintText: ProjectStrings.addTask.tr(),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
