import 'package:projetotarsis/db/db_helper.dart';
import 'package:sqflite/sqlite_api.dart';
import '../domain/propriedades.dart';

class PropriedadesDao {
  Future<List<Propriedade>> listarPropriedades() async {
    List<Propriedade> listaPropriedades = [];
    Database db = await DBHelper().initDB();

    String sql = 'SELECT * FROM Propriedade;';
    var listResult = await db.rawQuery(sql);

    for (var json in listResult) {
      Propriedade propriedade = Propriedade.fromJson(json);
      listaPropriedades.add(propriedade);
    }

    await Future.delayed(Duration(seconds: 3));

    return listaPropriedades;

  }
}