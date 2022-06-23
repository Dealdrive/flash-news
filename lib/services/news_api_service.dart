import 'package:news_app/models/article.dart';
import 'package:news_app/services/news_api.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/utils/constants.dart';

class NewsApiService extends NewsApi {
  @override
  Future getTopHeadlinesForCategory({
    required String category,
    required String country,
  }) async {
    final uri =
        Uri.parse("$baseUrl/top-headlines?country=$country&category=$category");
    return await http.get(uri, headers: {"X-Api-Key": apiKey});
  }

  @override
  Future getTopHeadlinesForCountry(String country) async {
    final uri = Uri.parse("$baseUrl/top-headlines?country=$country");
    return await http.get(uri, headers: {"X-Api-Key": apiKey});
  }

  @override
  Future searchNews(String query) async {
    final uri = Uri.parse("$baseUrl/everything?q=$query");
    return await http.get(uri, headers: {"X-Api-Key": apiKey});
  }
}
