import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_app_demo/constants/colors.dart';
import 'package:notes_app_demo/model/task_model.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.currentListItem,
    required this.verifiediconButtOnPressed,
    required this.deleteIconButtonOnPressed,
  });
  final TaskModel currentListItem;
  final Function() verifiediconButtOnPressed;
  final Function() deleteIconButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: ProjectColors.blackColor.withOpacity(.2), blurRadius: 10),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: ListTile(
          enabled: currentListItem.isCompleted ? false : true,
          leading: CircleAvatar(
            backgroundColor: currentListItem.isCompleted
                ? ProjectColors.greenColor
                : ProjectColors.greyColor,
            child: IconButton(
              splashColor: ProjectColors.transparentColor,
              onPressed: () => verifiediconButtOnPressed(),
              icon: Icon(
                Icons.verified,
                color: currentListItem.isCompleted
                    ? ProjectColors.whiteColor
                    : ProjectColors.blackColor,
              ),
            ),
          ),
          title: Text(
            currentListItem.taskText,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                DateFormat('hh:mm a ').format(currentListItem.taskTime),
              ),
              IconButton(
                onPressed: () => deleteIconButtonOnPressed(),
                icon: const Icon(Icons.delete),
              )
            ],
          )),
    );
  }
}
