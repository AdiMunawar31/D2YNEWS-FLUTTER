import 'package:d2ynews/models/article.dart';
import 'package:d2ynews/screen/detail_screen.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  static const routeName = '/article_list';

  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('D2YNEWS')),
      body: FutureBuilder<String>(
        future:
            DefaultAssetBundle.of(context).loadString('assets/articles.json'),
        builder: (context, snapshot) {
          final List<Article> articles = parseArticles(snapshot.data);
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return _buildArticleItem(context, articles[index]);
            },
          );
        },
      ),
    );
  }
}

Widget _buildArticleItem(BuildContext context, Article article) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    leading: Image.network(article.urlToImage, width: 100),
    title: Text(article.title),
    subtitle: Text(article.author),
    onTap: () {
      Navigator.pushNamed(context, DetailScreen.routeName, arguments: article);
    },
  );
}
