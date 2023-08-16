import 'package:todo_app/services/service_locator.dart';
import 'package:todo_app/templets/app_asset.dart';
import 'package:todo_app/templets/app_asset.dart';
import 'package:todo_app/templets/cache_helper.dart';
import 'package:todo_app/templets/colors.dart';
import 'package:todo_app/templets/strings.dart';

import 'package:flutter/material.dart';

import 'home.dart';
import 'templets/on_boarding1.dart';
class ToDoApp extends StatefulWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() {
    bool isVisited=sl<CacheHelper>().getData(key:AppString.onBoardingKey)?? false;
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) =>isVisited? const HomeScreen(): OnBoardingOne()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.logo),
            SizedBox(
              height: 24,
            ),
            Text(
              AppString.AppName,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 40
              ),
            ),
          ],
        ),
      ),
    );
  }
}
