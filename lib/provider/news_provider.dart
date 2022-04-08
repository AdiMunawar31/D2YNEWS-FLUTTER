import 'package:d2ynews/data/api/api_service.dart';
import 'package:d2ynews/data/models/article.dart';
import 'package:d2ynews/utils/result_state.dart';
import 'package:flutter/cupertino.dart';

class NewsProvider extends ChangeNotifier {
  final ApiService apiService;

  NewsProvider({required this.apiService}) {
    _fetchAllArticle();
  }

  late ArticlesResult _articlesResult;
  late ResultState _state;
  late String _message = '';

  String get message => _message;

  ArticlesResult get result => _articlesResult;

  ResultState get state => _state;

  Future<dynamic> _fetchAllArticle() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final article = await apiService.topHeadlines();
      if (article.articles.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _articlesResult = article;
      }
    } catch (err) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $err';
    }
  }
}
