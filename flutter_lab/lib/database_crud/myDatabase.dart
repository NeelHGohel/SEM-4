import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDatabaseCRUD {
  static const String TBL_USERS = 'users';
  static const String USER_ID = 'id';
  static const String USER_NAME = 'name';
  static const String USER_EMAIL = 'email';
  static const String USER_CITY = 'city';

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'DbForCrud.db');

    return await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await db.execute(''' 
          CREATE TABLE $TBL_USERS(
            $USER_ID INTEGER PRIMARY KEY AUTOINCREMENT,
            $USER_NAME TEXT,
            $USER_EMAIL TEXT UNIQUE,
            $USER_CITY TEXT
          )
        ''');
        print(":::::::::::::::::::Database table created.::::::::::::::::::::::");
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        print("Database upgraded from version $oldVersion to $newVersion");
        if (oldVersion < 2) {
          await db.execute(''' 
            ALTER TABLE $TBL_USERS ADD COLUMN $USER_CITY TEXT;
          ''');
        }
      },
    );
  }

  Future<void> insertUser (Map<String, dynamic> user) async {
    final db = await initDatabase();
    await db.insert(TBL_USERS, user);
  }

  Future<void> updateUser (int id, Map<String, dynamic> user) async {
    final db = await initDatabase();
    await db.update(
      TBL_USERS,
      user,
      where: '$USER_ID = ?',
      whereArgs: [id],
    );
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final db = await initDatabase();
    return await db.query(TBL_USERS);
  }

  Future<void> deleteUser (int id) async {
    final db = await initDatabase();
    await db.delete(
      TBL_USERS,
      where: '$USER_ID = ?',
      whereArgs: [id],
    );
  }
}