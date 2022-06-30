import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:news_app/bloc/news_bloc/news_state.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/services/news_api.dart';
import 'dart:convert';
import 'news_event.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsApi apiService;

  NewsBloc(this.apiService) : super(const NewsState.loading()) {

    on<LoadTopHeadlinesForCountryEvent>(_loadTopHeadlinesForCountryEvent);

    on<LoadTopHeadlinesForCategoryEvent>(_loadTopHeadlinesForCategoryEvent);

  }

  void _loadTopHeadlinesForCountryEvent(
    LoadTopHeadlinesForCountryEvent event,
    Emitter<NewsState> emit,
  ) async {
    try {
      emit(const NewsState.loading());
      final Response response =
          await apiService.getTopHeadlinesForCountry(event.countryCode);
      if (response.statusCode == 200) {
        final result = response.body;
        final jsonResult = json.decode(result) as Map<String, dynamic>;
        final articleList = jsonResult["articles"] as List<dynamic>;
        final articles = articleList
            .map(
              (item) => Article.fromJson(item),
            )
            .toList();
        emit(NewsState.success(articles));
      } else {
        final errorResponse = json.decode(response.body) as Map<String, dynamic>;
        emit(NewsState.error(errorResponse["message"]));
      }
    } catch (e) {
      emit(const NewsState.error(null));
    }
  }

  void _loadTopHeadlinesForCategoryEvent(
    LoadTopHeadlinesForCategoryEvent event,
    Emitter<NewsState> emit,
  ) async {
    try {
      emit(const NewsState.loading());
      final Response response = await apiService.getTopHeadlinesForCategory(
        category: event.category,
        country: event.countryCode,
      );
      if (response.statusCode == 200) {
        final result = response.body;
        final jsonResult = json.decode(result) as Map<String, dynamic>;
        final articleList = jsonResult["articles"] as List<dynamic>;
        final articles = articleList
            .map(
              (item) => Article.fromJson(item),
            )
            .toList();
        emit(NewsState.success(articles));
      } else {
        final errorResponse = json.decode(response.body) as Map<String, dynamic>;
        emit(NewsState.error(errorResponse["message"]));
      }
    } catch (e) {
      emit(const NewsState.error(null));
    }
  }
}
