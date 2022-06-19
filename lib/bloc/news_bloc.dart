import 'package:bloc/bloc.dart';
import 'package:news_app/bloc/news_event.dart';
import 'package:news_app/bloc/news_state.dart';
import 'package:news_app/services/news_api.dart';

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
  ) {}

  void _loadTopHeadlinesForCategoryEvent(
    LoadTopHeadlinesForCategoryEvent event,
    Emitter<NewsState> emit,
  ) {}

  void _searchNewsEvent(
    SearchNewsEvent event,
    Emitter<NewsState> emit,
  ) {}
}
