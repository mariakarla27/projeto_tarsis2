import 'package:dio/dio.dart';
import '../domain/articles.dart';

class ArticlesApi {
  final dio = Dio();
  String baseUrl = 'https://newsapi.org/v2';

  Future<List<Articles>> findAll() async {
    //se atentar ao link da api,perguntar ao Tarsis
    var result = await dio.get('$baseUrl/everything?q=cancer&from=2025-09-23&sortBy=publishedAt&apiKey=025a8799dfe447ddb1894e590f2dc194');

    //if (result.statusCode == 200) {
    var jsonResult = result.data;

    var list = jsonResult['articles'];
    List<Articles> articles = [];
    for (var json in list) {
      print(json);
      Articles art = Articles.fromJson(json);
      articles.add(art);
    }

    return articles;
  }
}
