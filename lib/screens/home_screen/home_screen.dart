import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:news_app/bloc/news_bloc/news_bloc.dart';
import 'package:news_app/bloc/news_bloc/news_event.dart';
import 'package:news_app/bloc/news_bloc/news_state.dart';
import 'package:news_app/bloc/search_news_bloc/search_news_bloc.dart';
import 'package:news_app/bloc/search_news_bloc/search_news_event.dart';
import 'package:news_app/models/country.dart';
import 'package:news_app/screens/home_screen/widgets/nav_drawer.dart';
import 'package:news_app/screens/search_screen/search_screen.dart';
import 'package:news_app/screens/shared/no_results_widget.dart';
import '../shared/loading_error_widget.dart' as error;
import '../../models/category.dart';
import 'widgets/category_chips.dart';
import '../shared/news_item_card.dart';

class HomeScreen extends HookWidget {
  static const String routeName = "/";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedCategory = useState(Category.categories[0]);
    final selectedCountry = useState(Country.countries[0]);
    final showExpandedSearchBar = useState(false);
    final searchController = useTextEditingController();
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
          title: showExpandedSearchBar.value
              ? _searchBar(
                  searchController: searchController,
                  onSubmitted: (value) {
                    final query = searchController.text.trim();
                    searchController.clear();
                    showExpandedSearchBar.value = false;
                    if(query.isNotEmpty) {
                      context.read<SearchNewsBloc>().add(
                        GetSearchedNewsEvent(query: query),
                      );
                      Navigator.of(context).pushNamed(
                        SearchScreen.routeName,
                        arguments: query,
                      );
                    }
                  },
                )
              : selectedCategory.value == Category.categories[0]
                  ? Text(
                      "Top Headlines in ${selectedCountry.value.name}",
                      style: const TextStyle(fontSize: 17),
                    )
                  : Column(
                      children: [
                        Text(
                          "Top Headlines in ${selectedCountry.value.name}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          selectedCategory.value.name,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
          centerTitle: true,
          actions: [
            showExpandedSearchBar.value
                ? IconButton(
                    onPressed: () {
                      searchController.clear();
                      showExpandedSearchBar.value = false;
                    },
                    icon: const Icon(Icons.close),
                  )
                : IconButton(
                    onPressed: () {
                      showExpandedSearchBar.value = true;
                    },
                    icon: const Icon(Icons.search, color: Colors.white),
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
                      if (articles.isNotEmpty) {
                        return ListView.builder(
                            itemCount: articles.length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(top: 8.0),
                            itemBuilder: (context, index) {
                              final article = articles[index];
                              return NewsItemCard(article: article);
                            });
                      }
                      else {
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
            ),
          ],
        ));
  }

  TextField _searchBar(
      {required TextEditingController searchController,
      required Function(String) onSubmitted}) {
    return TextField(
      controller: searchController,
      enableSuggestions: true,
      maxLines: 1,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      onSubmitted: onSubmitted,
      autofocus: true,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: const InputDecoration(
        hintText: "Search query...",
        hintStyle: TextStyle(color: Colors.white),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
