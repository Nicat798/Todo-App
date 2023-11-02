import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:notes_app_demo/constants/constants.dart';
import 'package:notes_app_demo/services/hive_service.dart';
import 'package:notes_app_demo/view/main_screen.dart';
import 'package:notes_app_demo/widgets/themedata.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await HiveService().startHive();
  runApp(
    EasyLocalization(
      supportedLocales: ProjectStrings.translationsList,
      path: ProjectStrings.easyLocalizationPath,
      fallbackLocale: ProjectStrings.translationsList.first,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.deviceLocale,
      theme: customThemeData(),
      debugShowCheckedModeBanner: false,
      title: ProjectStrings.materialTitle,
      home: const HomePage(),
    );
  }
}
