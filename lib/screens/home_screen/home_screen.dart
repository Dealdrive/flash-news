import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_bloc.dart';
import 'package:news_app/bloc/news_event.dart';
import 'package:news_app/bloc/news_state.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/screens/home_screen/widgets/nav_drawer.dart';

import '../../models/category.dart';
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
          title: const Text(
            "Top Headlines",
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            )
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 70,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 8),
                  children: Category.categories.map((category) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ActionChip(
                        label: Text(
                          category.name,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        pressElevation: 10.0,
                        padding:
                            const EdgeInsets.only(left: 2, top: 2, bottom: 2),
                        elevation: category.name == "Sports" ? 5.0 : 0.0,
                        backgroundColor:  category.backgroundColor,
                        avatar: CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.8),
                          child: Icon(
                            category.icon,
                            color: category.backgroundColor,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    );
                  }).toList()),
            ),
            Expanded(
              child: BlocBuilder<NewsBloc, NewsState>(
                builder: (context, state) {
                  return state.when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
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
                    error: (errorMessage) =>
                        Text(errorMessage ?? "Error occurred!"),
                  );
                },
              ),
            ),
          ],
        ));
  }

  List<Widget> _newsCategories() {
    return [
      ActionChip(
        label: const Text(
          "Top Headlines",
          style: TextStyle(color: Colors.white),
        ),
        padding: const EdgeInsets.only(left: 2, top: 2, bottom: 2),
        elevation: 5.0,
        backgroundColor: Colors.redAccent.shade200,
        avatar: CircleAvatar(
          backgroundColor: Colors.white.withOpacity(0.8),
          child: Icon(
            Icons.newspaper,
            color: Colors.redAccent.shade200,
          ),
        ),
        onPressed: () {},
      ),
      const SizedBox(width: 8.0),
      ActionChip(
        label: Text(
          "Sports",
          style: TextStyle(color: Colors.white),
        ),
        padding: const EdgeInsets.only(left: 2, top: 2, bottom: 2),
        elevation: 5.0,
        backgroundColor: Colors.green.shade300,
        avatar: Icon(Icons.sports_baseball),
        onPressed: () {},
      ),
      const SizedBox(width: 8.0),
      ActionChip(
        label: Text("Entertainment"),
        backgroundColor: Colors.orange,
        avatar: Icon(Icons.movie),
        onPressed: () {},
      ),
      const SizedBox(width: 8.0),
      ActionChip(
        label: Text("Business"),
        avatar: Icon(Icons.business_center),
        onPressed: () {},
      ),
      const SizedBox(width: 8.0),
      ActionChip(
        label: Text("Science"),
        avatar: Icon(Icons.science_outlined),
        onPressed: () {},
      ),
      const SizedBox(width: 8.0),
      ActionChip(
        label: Text("Technology"),
        avatar: Icon(Icons.biotech_outlined),
        onPressed: () {},
      ),
      const SizedBox(width: 8.0),
      ActionChip(
        label: Text("Health"),
        avatar: Icon(Icons.health_and_safety_outlined),
        onPressed: () {},
      ),
    ];
  }
}
