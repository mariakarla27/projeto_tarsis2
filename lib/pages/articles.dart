import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projetotarsis/api/article_api.dart';
import 'package:projetotarsis/api/propriedadesApi.dart';
import 'package:projetotarsis/domain/articles.dart';
import 'package:projetotarsis/pages/favorite_article_page.dart';
import 'package:projetotarsis/provider/favorite_provider.dart';
import 'package:provider/provider.dart';
import '../domain/propriedades.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  late Future<List<Article>> futureArticles;
  int selectedIndex = 0;

  void initState() {
    super.initState();
    futureArticles = ArticlesApi().findAll();
  }

  @override
  Widget build(BuildContext context) {
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
            'Artigos',
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
        //  appBar: AppBar(backgroundColor: Colors.indigo[900]),
        bottomNavigationBar: Container(
          height: 70,
          color: Colors.indigo[900],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              FutureBuilder(
                future: futureArticles,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('error');
                  }

                  if (snapshot.hasData) {
                    List<Article> lista = snapshot.requireData;
                    return buildListView(lista);
                  }

                  return Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFF846EB4),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  buildListView(articleList) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: articleList.length,
      itemBuilder: (context, i) {
        return CardArticle(
          articleList[i],
        );
      },
    );
  }

  CardArticle(Article article) {
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
        )


        // IconButton(
        //   icon: Icon(Icons.favorite, color: Colors.pink, size: 32),
        //   onPressed: () {},
        // ),
      ],
    );
  }

  buildCardArticleContent(article) {
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
          // Texto/descrição
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
