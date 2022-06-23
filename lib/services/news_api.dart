import 'package:news_app/models/article.dart';

abstract class NewsApi {
  Future getTopHeadlinesForCountry(String country);

  Future getTopHeadlinesForCategory({
    required String category,
    required String country,
  });

  Future searchNews(String query);
}
