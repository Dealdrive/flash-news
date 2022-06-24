import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/models/article.dart';

part 'search_news_state.freezed.dart';

@freezed
abstract class SearchNewsState with _$SearchNewsState {
  const factory SearchNewsState.loading() = _loading;
  const factory SearchNewsState.success(List<Article> articles) = _success;
  const factory SearchNewsState.error(String? errorMessage) = _error;
}