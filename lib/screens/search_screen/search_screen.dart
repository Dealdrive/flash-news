import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/search_news_bloc/search_news_bloc.dart';
import 'package:news_app/bloc/search_news_bloc/search_news_state.dart';
import 'package:news_app/screens/shared/news_item_card.dart';
import '../shared/error_widget.dart' as error;

class SearchScreen extends StatelessWidget {
  static const String routeName = "/search-screen";
  final String searchQuery;

  const SearchScreen({
    Key? key,
    required this.searchQuery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search results for $searchQuery",
          style: const TextStyle(fontSize: 17),
        ),
      ),
      body: BlocBuilder<SearchNewsBloc, SearchNewsState>(
        builder: (context, state) {
          return state.when(
            loading: () => Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            ),
            success: (articles) {
              return ListView.builder(
                  itemCount: articles.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 8.0),
                  itemBuilder: (context, index) {
                    final article = articles[index];
                    return NewsItemCard(article: article);
                  });
            },
            error: (errorMessage) {
              return error.ErrorWidget(
                errorMessage: errorMessage,
              );
            },
          );
        },
      ),
    );
  }
}
