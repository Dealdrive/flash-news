import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_bloc.dart';
import 'package:news_app/bloc/news_event.dart';
import 'package:news_app/bloc/news_state.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/screens/home_screen/widgets/nav_drawer.dart';

import 'widgets/news_item_card.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(
          onTap: (country) {
            context.read<NewsBloc>().add(
                  LoadTopHeadlinesForCountryEvent(country: country),
                );
          },
        ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text("Top Headlines"),
        ),
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            return state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (articles) {
                return ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      final article = articles[index];
                      return NewsItemCard(article: article);
                    });
              },
              error: (errorMessage) => Text(errorMessage ?? "Error occurred!"),
            );
          },
        ));
  }
}
