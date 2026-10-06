import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:todo_project/core/hive/hive_registrar.g.dart';
import 'package:todo_project/core/utls/app_constants.dart';
import 'package:todo_project/models/task_model.dart';
import 'package:todo_project/models/user_data.dart';
import 'package:todo_project/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapters();
  await Hive.openBox<UserData>(AppConstants.userBox);
  await Hive.openBox<TaskModel>(AppConstants.taskBox);
  Hive.box<UserData>(AppConstants.userBox).clear();
  Hive.box<TaskModel>(AppConstants.taskBox).clear();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      child: MyApp(),
    ),
  );
}
