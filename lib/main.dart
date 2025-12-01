import 'package:projetotarsis/pages/articles.dart';
import 'package:projetotarsis/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:projetotarsis/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ArticlePage(),
      ),
    ),
  );
}
