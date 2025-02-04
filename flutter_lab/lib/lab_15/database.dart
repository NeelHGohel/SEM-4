import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDatabase {
  Future<Database> initDatabase() async {
    Directory directory = await getApplicationCacheDirectory();
    String path = join(directory.path, 'To_DO_List.db');

    var db = await openDatabase(path, onCreate: (db, version) async {
      await db.execute(''' 
          CREATE TABLE Category (
            category_id INTEGER PRIMARY KEY AUTOINCREMENT,
            category_name TEXT NOT NULL
          );
      ''');

      await db.execute(''' 
          CREATE TABLE Task (
            task_id INTEGER PRIMARY KEY AUTOINCREMENT,
            task_name TEXT NOT NULL,
            description TEXT,
            due_date TEXT,
            status TEXT DEFAULT 'pending',
            category_id INTEGER,
            FOREIGN KEY (category_id) REFERENCES Category (category_id)
          );
      ''');

      await db.insert('Category', {'category_name': 'Work'});
      await db.insert('Category', {'category_name': 'Personal'});
      await db.insert('Category', {'category_name': 'Shopping'});
      await db.insert('Category', {'category_name': 'Study'});
      await db.insert('Category', {'category_name': 'Fitness'});

    }, version: 1);

    return db;
  }

  Future<int> insertCategory(String categoryName) async {
    Database db = await initDatabase();
    return await db.insert('Category', {'category_name': categoryName});
  }

  Future<int> insertTask(String taskName, String description, String dueDate, int categoryId) async {
    Database db = await initDatabase();
    return await db.insert('Task', {
      'task_name': taskName,
      'description': description,
      'due_date': dueDate,
      'category_id': categoryId,
    });
  }

  Future<void> selectAllTasks() async {
    Database db = await initDatabase();
    List<Map<String, dynamic>> tasks = await db.query('Task');
    print('All Tasks:');
    tasks.forEach((task) {
      print(task);
    });
  }

  Future<List<Map<String, dynamic>>> selectAllCategories() async {
    Database db = await initDatabase();
    List<Map<String, dynamic>> categories = await db.query('Category');
    return categories;
  }

  Future<void> selectTasksByCategory(int categoryId) async {
    Database db = await initDatabase();
    String query = '''
      SELECT Task.task_id, Task.task_name, Task.description, Task.due_date, Task.status, Category.category_name
      FROM Task
      INNER JOIN Category ON Task.category_id = Category.category_id
      WHERE Category.category_id = ?
    ''';
    List<Map<String, dynamic>> tasks = await db.rawQuery(query, [categoryId]);
    print('Tasks in Category ID $categoryId:');
    tasks.forEach((task) {
      print(task);
    });
  }

  Future<int> updateTaskStatus(int taskId, String status) async {
    Database db = await initDatabase();
    return await db.update('Task', {'status': status}, where: 'task_id = ?', whereArgs: [taskId]);
  }
}