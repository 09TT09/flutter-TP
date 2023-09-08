import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseConnect {
  static Future<Database> openDatabaseConnection() async {
    String path = join(await getDatabasesPath(), 'mydb.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            userId INTEGER PRIMARY KEY AUTOINCREMENT,
            userName TEXT NOT NULL,
            userPassword TEXT NOT NULL
          )
        ''');

        await db.insert(
          'users',
          {
            'userName': 'theo',
            'userPassword': 'password',
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      },
    );
  }

  static Future<List<Map<String, dynamic>>> getAllUsers(Database database) async {
    final List<Map<String, dynamic>> users = await database.query('users');
    return users;
  }
}