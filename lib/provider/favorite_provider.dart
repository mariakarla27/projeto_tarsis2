import 'package:flutter/foundation.dart';
import 'package:projetotarsis/domain/articles.dart';

class FavoriteProvider extends ChangeNotifier {
  late List<Article> _articles;

  List<Article> get articles => _articles;

  FavoriteProvider(){
    _articles = [];
  }

  addArticle(Article article) {
    _articles.add(article);
    notifyListeners();
  }

}
