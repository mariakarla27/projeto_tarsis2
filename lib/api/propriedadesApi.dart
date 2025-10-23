import 'package:dio/dio.dart';
import '../domain/propriedades.dart';

class PropriedadesApi {
  final dio = Dio();
  final String baseUrl = 'https://my-json-server.typicode.com/mariakarla27/api-fake';

  Future<List<Propriedade>> findAll() async {
    List<Propriedade> listaNoticias  = [];
    // Database db = await DBHelper().initDB();
    // String sql = 'SELECT * FROM PROPRIEDADE;';
    // var listResult = await db.rawQuery(sql);

    final response = await dio.get('$baseUrl/noticias');

    if (response.statusCode == 200) {
      var listResult = response.data;
      for (var json in listResult) {
        Propriedade propriedade = Propriedade.fromJson(json);
        listaNoticias.add(propriedade);
      }
    }

    await Future.delayed(Duration(seconds: 3));

    return listaNoticias;
  }
}