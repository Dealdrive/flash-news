import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:news_app/bloc/news_bloc.dart';
import 'package:news_app/bloc/news_event.dart';
import 'package:news_app/bloc/news_state.dart';
import 'package:news_app/models/country.dart';
import 'package:news_app/screens/home_screen/widgets/nav_drawer.dart';
import 'widgets/error_widget.dart' as error;
import '../../models/category.dart';
import 'widgets/category_chips.dart';
import 'widgets/news_item_card.dart';

class HomeScreen extends HookWidget {
  static const String routeName = "/";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedCategory = useState(Category.categories[0]);
    final selectedCountry = useState(Country.countries[0]);
    return Scaffold(
        drawer: NavDrawer(
          onTap: (country) {
            selectedCountry.value = country;
            if (selectedCategory.value == Category.categories[0]) {
              context.read<NewsBloc>().add(
                    LoadTopHeadlinesForCountryEvent(countryCode: country.code),
                  );
            } else {
              context.read<NewsBloc>().add(
                    LoadTopHeadlinesForCategoryEvent(
                      category: selectedCategory.value.id,
                      countryCode: country.code,
                    ),
                  );
            }
          },
        ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "Top Headlines in ${selectedCountry.value.name}",
            style: const TextStyle(fontSize: 17),
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
            CategoryChips(
              selectedCategory: selectedCategory,
              countryCode: selectedCountry.value.code,
            ),
            Expanded(
              child: BlocBuilder<NewsBloc, NewsState>(
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
            ),
          ],
        ));
  }
}


