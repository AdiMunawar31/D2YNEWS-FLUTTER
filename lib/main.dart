import 'package:d2ynews/models/article.dart';
import 'package:d2ynews/screen/article_webview.dart';
import 'package:d2ynews/screen/detail_screen.dart';
import 'package:d2ynews/screen/news_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'D2YNEWS',
      theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: NewsScreen.routeName,
      routes: {
        NewsScreen.routeName: (context) => NewsScreen(),
        DetailScreen.routeName: (context) => DetailScreen(
            article: ModalRoute.of(context)?.settings.arguments as Article),
        ArticleWebView.routeName: (context) => ArticleWebView(
            url: ModalRoute.of(context)?.settings.arguments as String)
      },
    );
  }
}
