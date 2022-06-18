
import 'package:news_app/models/article.dart';

abstract class NewsApi {

  Future getTopHeadlinesForCountry(String country);

  Future getTopHeadlinesForCategory(String category);

  Future searchNews(String query);

}