import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDatabase {
  // Initialize the database
  Future<Database> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory(); // Use getApplicationDocumentsDirectory for database location
    String path = join(directory.path, 'To_DO_List.db');

    var db = await openDatabase(path, onCreate: (db, version) async {
      // Create Category table
      await db.execute(''' 
          CREATE TABLE Category (
            category_id INTEGER PRIMARY KEY AUTOINCREMENT,
            category_name TEXT NOT NULL
          );
      ''');

      // Create Task table
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

      // Insert sample categories if they don't exist
      await db.insert('Category', {'category_name': 'Work'});
      await db.insert('Category', {'category_name': 'Personal'});
      await db.insert('Category', {'category_name': 'Shopping'});
      await db.insert('Category', {'category_name': 'Study'});
      await db.insert('Category', {'category_name': 'Fitness'});
    }, version: 1);

    return db;
  }

  // Insert a new category
  Future<int> insertCategory(String categoryName) async {
    Database db = await initDatabase();
    return await db.insert('Category', {'category_name': categoryName});
  }

  // Insert a new task
  Future<int> insertTask(String taskName, String description, String dueDate, int categoryId) async {
    Database db = await initDatabase();
    return await db.insert('Task', {
      'task_name': taskName,
      'description': description,
      'due_date': dueDate,
      'category_id': categoryId,
    });
  }

  // Fetch all tasks
  Future<List<Map<String, dynamic>>> selectAllTasks() async {
    Database db = await initDatabase();

    String query = '''
    SELECT Task.task_id, Task.task_name, Task.description, Task.due_date, Task.status, Category.category_name
    FROM Task
    INNER JOIN Category ON Task.category_id = Category.category_id
  ''';

    List<Map<String, dynamic>> tasks = await db.rawQuery(query);
    return tasks;
  }

  // Fetch all categories
  Future<List<Map<String, dynamic>>> selectAllCategories() async {
    Database db = await initDatabase();
    return await db.query('Category');
  }

  // Fetch task by ID for editing
  Future<Map<String, dynamic>?> selectTaskById(int taskId) async {
    Database db = await initDatabase();
    List<Map<String, dynamic>> result = await db.query('Task', where: 'task_id = ?', whereArgs: [taskId]);
    return result.isNotEmpty ? result.first : null;
  }

  // Fetch tasks by category
  Future<List<Map<String, dynamic>>> selectTasksByCategory(int categoryId) async {
    Database db = await initDatabase();
    String query = '''
      SELECT Task.task_id, Task.task_name, Task.description, Task.due_date, Task.status, Category.category_name
      FROM Task
      INNER JOIN Category ON Task.category_id = Category.category_id
      WHERE Category.category_id = ?
    ''';
    return await db.rawQuery(query, [categoryId]);
  }

  // Update task status
  Future<int> updateTaskStatus(int taskId, String status) async {
    Database db = await initDatabase();
    return await db.update('Task', {'status': status}, where: 'task_id = ?', whereArgs: [taskId]);
  }

  // Update task (task name, description, due date, category, and status)
  Future<int> updateTask(int taskId, String taskName, String description, String dueDate, int categoryId, String status) async {
    Database db = await initDatabase();
    return await db.update(
      'Task',
      {
        'task_name': taskName,
        'description': description,
        'due_date': dueDate,
        'category_id': categoryId,
        'status': status,
      },
      where: 'task_id = ?',
      whereArgs: [taskId],
    );
  }

  // Delete a task by ID
  Future<int> deleteTask(int taskId) async {
    Database db = await initDatabase();
    return await db.delete('Task', where: 'task_id = ?', whereArgs: [taskId]);
  }
}
