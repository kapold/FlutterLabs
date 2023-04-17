import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static late Database _db;
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String TABLE = 'MyTable';
  static const String DB_NAME = 'mydb.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $TABLE($ID INTEGER PRIMARY KEY, $NAME TEXT)');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    var dbClient = await db;
    return await dbClient.insert(TABLE, row);
  }

  Future<int> update(Map<String, dynamic> row) async {
    var dbClient = await db;
    return await dbClient.update(TABLE, row,
        where: '$ID = ?', whereArgs: [row[ID]]);
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(TABLE, where: '$ID = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    var dbClient = await db;
    return await dbClient.query(TABLE);
  }
}
