import 'package:dio/dio.dart';
import '../domain/address.dart';

class AddressApi {
  final dio = Dio();
  String baseUrl = 'https://newsapi.org';

  Future<Address> findByCep(String titulo) async {
    var result = await dio.get('$baseUrl/v2/everything?q=tesla&from=2025-09-20&sortBy=publishedAt&apiKey=API_KEY');
   //se atentar ao link da api,perguntar ao Tarsis

    //if (result.statusCode == 200) {
    var json = result.data;
    Address address = Address.fromJson(json);
    return address;
    //}
  }
}
