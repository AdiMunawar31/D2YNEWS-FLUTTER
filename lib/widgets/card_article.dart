import 'package:d2ynews/common/style.dart';
import 'package:d2ynews/screen/detail_screen.dart';
import 'package:flutter/material.dart';
import '../data/models/article.dart';

class CardArticle extends StatelessWidget {
  final Article article;

  const CardArticle({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColor,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Hero(
          tag: article.urlToImage!,
          child: Image.network(
            article.urlToImage!,
            width: 100,
          ),
        ),
        title: Text(
          article.title,
        ),
        subtitle: Text(article.author!),
        onTap: () => Navigator.pushNamed(
          context,
          DetailScreen.routeName,
          arguments: article,
        ),
      ),
    );
  }
}
