import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
abstract class NewsEvent {
  const NewsEvent();
}


class LoadTopHeadlinesForCountryEvent extends NewsEvent {
  final String countryCode;

  const LoadTopHeadlinesForCountryEvent({required this.countryCode});
}

class LoadTopHeadlinesForCategoryEvent extends NewsEvent {
  final String category;
  final String countryCode;

  const LoadTopHeadlinesForCategoryEvent({
    required this.category,
    required this.countryCode,
  });
}

