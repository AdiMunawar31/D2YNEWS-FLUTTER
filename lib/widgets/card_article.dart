import 'package:d2ynews/common/navigation.dart';
import 'package:d2ynews/common/style.dart';
import 'package:d2ynews/provider/database_provider.dart';
import 'package:d2ynews/ui/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/models/article.dart';

class CardArticle extends StatelessWidget {
  final Article article;

  const CardArticle({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, _) {
        return FutureBuilder<bool>(
          future: provider.isBookmarked(article.url),
          builder: (context, snapshot) {
            var isBookmarked = snapshot.data ?? false;
            return Material(
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
                subtitle: Text(article.author ?? ""),
                trailing: isBookmarked
                    ? IconButton(
                        icon: Icon(Icons.bookmark),
                        color: Theme.of(context).accentColor,
                        onPressed: () => provider.removeBookmark(article.url),
                      )
                    : IconButton(
                        icon: Icon(Icons.bookmark_border),
                        color: Theme.of(context).accentColor,
                        onPressed: () => provider.addBookmark(article),
                      ),
                onTap: () =>
                    Navigation.intentWithData(DetailScreen.routeName, article),
              ),
            );
          },
        );
      },
    );
  }
}
