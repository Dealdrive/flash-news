import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/models/article.dart';

part 'news_state.freezed.dart';

@freezed
abstract class NewsState with _$NewsState {
  const factory NewsState.loading() = _loading;

  const factory NewsState.success(List<Article> articles) = _success;

  const factory NewsState.error(String? errorMessage) = _error;

}
