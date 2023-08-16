import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/templets/strings.dart';
import 'package:todo_app/templets/theme.dart';
import 'package:flutter/material.dart';

import 'splash.dart';
import 'home.dart';

void main() async {
  // CasheHelper().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize:  Size (375, 812),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: getAppTheme(),
            title: AppString.AppName,
            home: ToDoApp(),
          );
        }
    );
  }
}
