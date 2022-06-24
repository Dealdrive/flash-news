import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:news_app/bloc/search_news_bloc/search_news_event.dart';
import 'package:news_app/bloc/search_news_bloc/search_news_state.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/services/news_api.dart';
import 'dart:convert';

class SearchNewsBloc extends Bloc<SearchNewsEvent, SearchNewsState> {
  final NewsApi apiService;

  SearchNewsBloc(this.apiService) : super(const SearchNewsState.loading()) {

    on<GetSearchedNewsEvent>(_searchNewsEvent);
  }


  void _searchNewsEvent(
      GetSearchedNewsEvent event,
      Emitter<SearchNewsState> emit,
      ) async {
    try {
      emit(const SearchNewsState.loading());
      final Response response = await apiService.searchNews(event.query);
      if (response.statusCode == 200) {
        final result = response.body;
        final jsonResult = json.decode(result) as Map<String, dynamic>;
        final articleList = jsonResult["articles"] as List<dynamic>;
        final articles = articleList
            .map(
              (item) => Article.fromJson(item),
        )
            .toList();
        emit(SearchNewsState.success(articles));
      } else {
        final errorResponse = json.decode(response.body) as Map<String, dynamic>;
        emit(SearchNewsState.error(errorResponse["message"]));
      }
    } catch (e) {
      emit(const SearchNewsState.error(null));
    }
  }


}
