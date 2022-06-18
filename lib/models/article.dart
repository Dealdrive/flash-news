import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String? author;
  final String? title;
  final String url;
  final String? imageUrl;
  final String? source;

  const Article({
    this.author,
    this.title,
    required this.url,
    this.imageUrl,
    this.source,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      author: json["author"] as String?,
      title: json["title"] as String?,
      url: json["url"] as String,
      imageUrl: json["urlToImage"] as String?,
      source: json["source"]["name"] as String?
    );
  }

  @override
  List<Object?> get props => [
        author,
        title,
        url,
        imageUrl,
        source,
      ];
}
