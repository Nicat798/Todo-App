import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:notes_app_demo/constants/colors.dart';
import 'package:notes_app_demo/constants/constants.dart';
import 'package:notes_app_demo/model/task_model.dart';
import 'package:notes_app_demo/storage/hive_storage.dart';
import 'package:notes_app_demo/viewmodel/main_screen_vm.dart';
import 'package:notes_app_demo/widgets/empty_list_widget.dart';
import 'package:notes_app_demo/widgets/task_card_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MainScreenVm(context: context),
        ),
        ChangeNotifierProvider(
          create: (context) => HiveLocalStorage(),
        ),
      ],
      child: Consumer<MainScreenVm>(
        builder: (context, mainScreenVm, child) => Scaffold(
          appBar: AppBar(
            title: Text(
              ProjectStrings.title.tr(),
              style: const TextStyle(color: ProjectColors.blackColor),
            ),
            actions: [
              IconButton(
                onPressed: () => mainScreenVm.openModalBottomSheet(),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          body: mainScreenVm.taskList.isNotEmpty
              ? ListView.builder(
                  itemCount: mainScreenVm.taskList.length,
                  itemBuilder: (BuildContext context, int index) {
                    TaskModel currentListItem = mainScreenVm.taskList[index];
                    return TaskCard(
                      currentListItem: currentListItem,
                      verifiediconButtOnPressed: () {
                        mainScreenVm.changeCompletedStatus(currentListItem);
                      },
                      deleteIconButtonOnPressed: () {
                        mainScreenVm.removeTaskFromList(index);
                        mainScreenVm.deleteTaskFromDb(currentListItem);
                      },
                    );
                  },
                )
              : const Center(
                  child: EmptyListWidget(),
                ),
        ),
      ),
    );
  }
}
