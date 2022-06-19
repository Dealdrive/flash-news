import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';
part 'article.g.dart';

@freezed
class Article with _$Article {

  const factory Article({
    final String? author,
    final String? title,
    required final String url,
    @JsonKey(name: "urlToImage")
    final String? imageUrl,
    required final Source source,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

}

@freezed
class Source with _$Source {

  const factory Source({String? id, String? name}) = _Source;


  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);


}
