import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../data_models/db_tap.dart';

class DBProvider {
  static final DBProvider db = DBProvider();
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationSupportDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Text ("
          "id INTEGER PRIMARY KEY,"
          "title TEXT,"
          "description TEXT,"
          ")");
    });
  }

  addTap(DBTap tap) async {
    final db = await database;
    var raw = await db.rawInsert(
      "INSERT Into Text (id, title, discription )"
      " VALUES (?,?,?)",
      [tap.id, tap.title, tap.description],
    );
    return raw;
  }
}
