import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import "package:path/path.dart" as path;

class MySharedSqlDb {
  static Database? _database;

  Future<Database> get database async {
    _database ??= await initialDb();

    return _database!;
  }

  initialDb() async {
    String databasePath = await getDatabasesPath();
    String name = 'shareds.db';
    String finalPath = path.join(databasePath, name);
    Database myDb = await openDatabase(finalPath,
        onCreate: _onCreate, version: 1, onUpgrade: _onUprade);
    return myDb;
  }

  _onCreate(Database db, int oldVersion) async {
    await db.execute(
        '''CREATE TABLE "shareds" (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,name TEXT NOT NULL,isOn TEXT NOT NULL)''');
  }

  _onUprade(Database db, int oldVersion, int newVersion) async {}

  Future<List<Map<String, Object?>>> readData(String table) async {
    Database? myDb = await database;
    List<Map<String, Object?>> response = await myDb.query(table);
    return response;
  }

  insertData(String table) async {
    Database? myDb = await database;
    int response = await myDb.insert(table, {
      "name": "voice",
      "isOn": "false",
    });
    // ignore: unused_local_variable
    int response2 = await myDb.insert(table, {
      "name": "complete",
      "isOn": "false",
    });
    return response;
  }

  updateData(String table, Map<String, Object?> values, int id) async {
    Database? myDb = await database;
    int response = await myDb.update(table, values, where: "id = $id");
    return response;
  }

  deleteData(String table, int id) async {
    Database? myDb = await database;
    int response = await myDb.delete(table, where: "id = $id");
    return response;
  }
}
