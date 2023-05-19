import 'package:sqflite/sqflite.dart';
import "package:path/path.dart";

class MySqlDb {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
    } else {
      return _db;
    }
    return null;
  }

  initialDb() async {
    String databasePath = await getDatabasesPath();
    String name = 'notes.db';
    String finalPath = join(databasePath, name);
    Database myDb = await openDatabase(finalPath,
        onCreate: _onCreate, version: 1, onUpgrade: _onUprade);
  }

  _onCreate(Database db, int oldVersion) async {
    await db.execute('''
    CREATE TABLE "notes" (
      "id" INTEGER AUTOINCREMENT NOT NULL PRIMARY KEY ,
      "note" TEXT NOT NULL
    )
    ''');
    print('create');
  }

  _onUprade(Database db, int oldVersion, int newVersion) {
    print('Upgrade');
  }

  readData(String sql) async {
    Database? myDb = await db;
    Future<List<Map<String, Object?>>> response = myDb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawDelete(sql);
    return response;
  }
}
