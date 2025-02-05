import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDatabase {
  Future<Database> initDatabase() async {
    Directory directory = await getApplicationCacheDirectory();
    String path = join(directory.path, 'ABC.db');
    var db = await openDatabase(path, onCreate: (db, version) async {
      await db.execute('''
        Create table ToDoList(
          activity_id INTEGER PRIMARY KEY AUTOINCREMENT,
          activity_name TEXT NOT NULL
        )
      ''');
    }, onUpgrade: (db, oldVersion, newVersion) {}, version: 1);
    return db;
  }

  Future<List<Map<dynamic, dynamic>>> selectToDoList() async {
    Database db = await initDatabase();
    return await db.rawQuery('select * from ToDoList');
  }

  Future<void> insertActivity(Map<String, dynamic> activity) async {
    Database db = await initDatabase();
    int id = await db.insert("ToDoList", activity);
  }


}
