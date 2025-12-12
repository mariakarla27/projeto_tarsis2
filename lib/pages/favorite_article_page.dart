import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projetotarsis/api/article_api.dart';
import 'package:projetotarsis/api/propriedadesApi.dart';
import 'package:projetotarsis/domain/articles.dart';
import 'package:projetotarsis/pages/favorite_article_page.dart';
import 'package:projetotarsis/provider/favorite_provider.dart';
import 'package:provider/provider.dart';
import '../domain/propriedades.dart';

class FavoriteArticlePage extends StatefulWidget {
  const FavoriteArticlePage({super.key});

  @override
  State<FavoriteArticlePage> createState() => _FavoriteArticlePageState();
}

class _FavoriteArticlePageState extends State<FavoriteArticlePage> {

  int selectedIndex = 0;

  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    // Caso vá carregar a lista depois, coloque aqui
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<FavoriteProvider>();
    articles = provider.articles;

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.padding),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return FavoriteArticlePage();
              },
            ));
          },
        ),
        backgroundColor: Colors.deepPurpleAccent[100],
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          title: Text(
            'Artigos favoritos',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.account_circle, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),

        bottomNavigationBar: Container(
          height: 70,
          color: Colors.indigo[900],
        ),

        body: Padding(
          padding: const EdgeInsets.all(16),
          child: buildListView(articles),
        ),
      ),
    );
  }

  Widget buildListView(List<Article> articleList) {
    return ListView.builder(
      //physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: articleList.length,
      itemBuilder: (context, i) {
        return CardArticle(articleList[i]);
      },
    );
  }

  Widget CardArticle(Article article) {
    return Stack(
      children: [
        buildCardArticleContent(article),

        Positioned(
          top: 8,
          right: 8,
          child: IconButton(
            icon: Icon(Icons.favorite, color: Colors.pink, size: 32),
            onPressed: () {
              var provider = context.read<FavoriteProvider>();
              provider.addArticle(article);
            },
          ),
        ),
      ],
    );
  }

  Widget buildCardArticleContent(Article article) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(12),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            article.urlToImage,
            height: 170,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(height: 24),
          Text(
            article.title,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8),
          Text(
            article.content,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}
