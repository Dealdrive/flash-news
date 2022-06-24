import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
abstract class SearchNewsEvent {
  const SearchNewsEvent();
}

class LoadingEvent extends SearchNewsEvent {}


class GetSearchedNewsEvent extends SearchNewsEvent {
  final String query;

  const GetSearchedNewsEvent({required this.query});
}


