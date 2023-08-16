import 'package:sqflite/sqflite.dart';

import '../add_task/task_model.dart';

class sqfliteHelper {
  late Database db;

  void initDb() async {
    await openDatabase(
      'task.db',
      version: 1,
      onCreate: (Database db, int v) {
        db.execute(''' CREATE TABLE TASKS   (
      id  INTEGER Primary Key AUTOINCREMENT,
       title TEXT,
       note TEXT,
       date TEXT,
       startTime TEXT, 
       endTIME TEXT,
       color INTEGER,
       isCompleted INTEGER 
      )''').then((value) => print('Db CREATED Successfully '));
      },
      onOpen: (db) => print('DateBase opened'),
    ).then((value) => db = value).catchError((e) {
      print(e.toString());
    });
  }

  Future<List<Map<String, dynamic>>> getFromDB() async {
    return await db.rawQuery('SELECT * FROM TASK');
  }

  Future insertToDb(TaskModel model) async {
    return await db.rawInsert('''INSERT INTO TASKS( 
    title,note,date,startTime,endTime,color,isCompleted,
    ) VALUES(${model.title},${model.note},${model.date},${model.startTime},${model.endTime},${model.color},${model.isCompleted},)''');
  }
  Future<int> updateDB(int id)async{
    return  await db.rawUpdate('''
    UPDATE TASKS=?
    WHERE id=?
    ''',[1,id]);
  }
  Future<int> deleteFromDB(int id)async{
    return  await db.rawDelete('''
   DELETE FROM TASKS=?
    WHERE id=?
    ''',[id]);
  }

}
