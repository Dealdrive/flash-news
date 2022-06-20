import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
abstract class NewsEvent {
  const NewsEvent();
}


class LoadingEvent extends NewsEvent {

}

class LoadTopHeadlinesForCountryEvent extends NewsEvent {

  final String country;
  const LoadTopHeadlinesForCountryEvent({required this.country});
}

class LoadTopHeadlinesForCategoryEvent extends NewsEvent {

  final String category;
  const LoadTopHeadlinesForCategoryEvent({required this.category});
}

class SearchNewsEvent extends NewsEvent {

  final String query;
  const SearchNewsEvent({required this.query});
}