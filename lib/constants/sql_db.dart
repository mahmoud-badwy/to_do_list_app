import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import "package:path/path.dart" as path;

class MySqlDb {
  static Database? _database;

  Future<Database> get database async {
    _database ??= await initialDb();

    return _database!;
  }

  initialDb() async {
    String databasePath = await getDatabasesPath();
    String name = 'notes.db';
    String finalPath = path.join(databasePath, name);
    Database myDb = await openDatabase(finalPath,
        onCreate: _onCreate, version: 1, onUpgrade: _onUprade);
    return myDb;
  }

  _onCreate(Database db, int oldVersion) async {
    await db.execute('''
    CREATE TABLE "notes" (
      "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,
      "note" TEXT NOT NULL , 
      "typeRead" TEXT NOT NULL , 
      "kind" TEXT NOT NULL , 
    )
    ''');
    print('create');
  }

  _onUprade(Database db, int oldVersion, int newVersion) {
    print('Upgrade');
  }

  readData(String table) async {
    Database? myDb = await database;
    Future<List<Map<String, Object?>>> response = myDb.query(table);
    return response;
  }

  insertData(String table ,Map<String, Object?> values) async {
    Database? myDb = await database;
    int response = await myDb.insert(table, values);
    return response;
  }

  updateData(String sql) async {
    Database? myDb = await database;
    int response = await myDb.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? myDb = await database;
    int response = await myDb.rawDelete(sql);
    return response;
  }
}
