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
    icon_type INT,
    titulo TEXT,
    texto TEXT
    );''';

    await db.execute(sql);

    sql=
    '''
    INSERT INTO Propriedade (icon_type, titulo, texto) VALUES
    (0, 'DIAGNÓSTICO PRECOCE SALVA VIDAS', 'Quando detectado nas fases iniciais, o câncer de pulmão tem chances muito maiores de cura.'),
    (1, 'TABAGISMO AINDA É O MAIOR VILÃO', 'Fumar continua sendo o principal fator de risco para o desenvolvimento do câncer de pulmão.'),
    (2, 'PARAR DE FUMAR REDUZ RISCO EM ATÉ 90%', 'Abandonar o cigarro é a medida mais eficaz para prevenir o câncer de pulmão.'),
    (3, 'CÂNCER DE PULMÃO TEM SINAIS:', 'Tosse persistente, falta de ar e dor no peito podem ser sintomas iniciais da doença.'),
    (4, 'PREVENIR É O MELHOR REMÉDIO', 'Estilo de vida saudável e evitar o tabaco são fundamentais para proteger a saúde pulmonar.');
    ''';
    await db.execute(sql);

    /*sql =
    "INSERT INTO Propriedade (titulo , texto) VALUES ('noticia 1' , 'cancer nao');";
    await db.execute(sql);

    sql =
    "INSERT INTO Propriedade (titulo , texto) VALUES ('noticia 2' , 'cancer nao');";
    await db.execute(sql);

    sql =
    "INSERT INTO Propriedade (titulo , texto) VALUES ('noticia 3' , 'cancer nao');";
    await db.execute(sql); */
  }
}