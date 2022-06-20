import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_bloc.dart';
import 'package:news_app/bloc/news_state.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
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
                  return ListTile(
                    title: Text(article.title ?? ""),
                    subtitle: Text(article.author ?? ""),
                  );
                });
              },
              error: (errorMessage) => Text(errorMessage ?? "Error occurred!"),
            );
          },
        ));
  }
}
