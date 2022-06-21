import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:news_app/bloc/news_event.dart';
import 'package:news_app/bloc/news_state.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/services/news_api.dart';
import 'dart:convert';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsApi apiService;

  NewsBloc(this.apiService) : super(const NewsState.loading()) {
    on<LoadTopHeadlinesForCountryEvent>(_loadTopHeadlinesForCountryEvent);

    on<LoadTopHeadlinesForCategoryEvent>(_loadTopHeadlinesForCategoryEvent);

    on<SearchNewsEvent>(_searchNewsEvent);
  }

  void _loadTopHeadlinesForCountryEvent(
    LoadTopHeadlinesForCountryEvent event,
    Emitter<NewsState> emit,
  ) async {
    try {
      emit(const NewsState.loading());
      print("Emitted loading");
      final Response response =
          await apiService.getTopHeadlinesForCountry(event.country);
      print("Response received");
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
        emit(NewsState.error(response.body));
      }
    } catch (e) {
      emit(const NewsState.error("Error occurred"));
    }
  }

  void _loadTopHeadlinesForCategoryEvent(
    LoadTopHeadlinesForCategoryEvent event,
    Emitter<NewsState> emit,
  ) {}

  void _searchNewsEvent(
    SearchNewsEvent event,
    Emitter<NewsState> emit,
  ) {}
}
