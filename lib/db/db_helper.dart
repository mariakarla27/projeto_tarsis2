import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'airbnb.db';

    String dbPath = join(path, dbName);
    print(dbPath);
    var db = await openDatabase(dbPath, version: 1, onCreate: onCreate);
    return db;
  }

  Future<void> onCreate(Database db, int version) async {
    String sql = '''CREATE TABLE Propriedade (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT,
    texto TEXT
    );''';

    await db.execute(sql);

    sql =
    "INSERT INTO Propriedade (titulo , texto) VALUES ('noticia 1' , 'cancer nao');";
    await db.execute(sql);

    sql =
    "INSERT INTO Propriedade (titulo , texto) VALUES ('noticia 2' , 'cancer nao');";
    await db.execute(sql);

    sql =
    "INSERT INTO Propriedade (titulo , texto) VALUES ('noticia 3' , 'cancer nao');";
    await db.execute(sql);
  }
}