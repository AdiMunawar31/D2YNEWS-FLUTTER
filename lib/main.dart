import 'package:d2ynews/data/models/article.dart';
import 'package:d2ynews/ui/article_webview.dart';
import 'package:d2ynews/ui/detail_screen.dart';
import 'package:d2ynews/ui/home_screen.dart';
import 'package:d2ynews/common/style.dart';
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
          colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              onPrimary: Colors.black,
              secondary: secondaryColor),
          textTheme: myTextTheme,
          appBarTheme: AppBarTheme(elevation: 0),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: secondaryColor,
            unselectedItemColor: Colors.grey,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        DetailScreen.routeName: (context) => DetailScreen(
            article: ModalRoute.of(context)?.settings.arguments as Article),
        ArticleWebView.routeName: (context) => ArticleWebView(
            url: ModalRoute.of(context)?.settings.arguments as String)
      },
    );
  }
}
