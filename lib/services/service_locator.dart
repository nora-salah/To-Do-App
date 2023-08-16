import 'package:todo_app/cashe/sqflite.dart';
import 'package:todo_app/templets/cache_helper.dart';
import 'package:get_it/get_it.dart';

import '../cashe/sqflite.dart';
import '../templets/cache_helper.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  sl.registerLazySingleton<CacheHelper>(()=>CacheHelper());
  sl.registerLazySingleton<sqfliteHelper>(()=>sqfliteHelper());

  // getIt.registerSingleton<AppModel>(AppModel());

// Alternatively you could write it if you don't like global variables
  //GetIt.I.registerSingleton<AppModel>(AppModel());
}