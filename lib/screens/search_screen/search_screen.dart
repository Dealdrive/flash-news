import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/search_news_bloc/search_news_bloc.dart';
import 'package:news_app/bloc/search_news_bloc/search_news_state.dart';
import 'package:news_app/screens/shared/news_item_card.dart';
import 'package:news_app/screens/shared/no_results_widget.dart';
import 'package:news_app/utils/build_context_ext.dart';
import '../shared/loading_error_widget.dart' as error;

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
          "${context.localizations.search_result_title} $searchQuery",
          style: const TextStyle(fontSize: 16),
        ),
        titleSpacing: 2.0,
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
              if (articles.isNotEmpty) {
                return ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 8.0),
                    itemBuilder: (context, index) {
                      final article = articles[index];
                      return NewsItemCard(article: article);
                    });
              } else {
                return const NoResultWidget();
              }
            },
            error: (errorMessage) {
              return error.LoadingErrorWidget(
                errorMessage: errorMessage,
              );
            },
          );
        },
      ),
    );
  }
}
