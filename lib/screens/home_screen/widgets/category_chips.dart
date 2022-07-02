import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_bloc/news_bloc.dart';
import 'package:news_app/bloc/news_bloc/news_event.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/utils/localized_category.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({
    Key? key,
    required this.selectedCategory,
    required this.countryCode,
  }) : super(key: key);

  final ValueNotifier<Category> selectedCategory;
  final String countryCode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 8),
          children: Category.categories.map((category) {
            return Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: ActionChip(
                label: Text(
                  getLocalizedCategoryName(context, category.name),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                pressElevation: 10.0,
                padding: const EdgeInsets.only(left: 2, top: 2, bottom: 2),
                elevation: 5.0,
                backgroundColor: selectedCategory.value == category
                    ? Theme.of(context).primaryColor
                    : category.backgroundColor,
                avatar: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.8),
                  child: Icon(
                    category.icon,
                    color: selectedCategory.value == category
                        ? Theme.of(context).primaryColor
                        : category.backgroundColor,
                  ),
                ),
                onPressed: () {
                  selectedCategory.value = category;
                  if (category == Category.categories[0]) {
                    context.read<NewsBloc>().add(
                          LoadTopHeadlinesForCountryEvent(
                            countryCode: countryCode,
                          ),
                        );
                  } else {
                    context.read<NewsBloc>().add(
                          LoadTopHeadlinesForCategoryEvent(
                            category: category.id,
                            countryCode: countryCode,
                          ),
                        );
                  }
                },
              ),
            );
          }).toList()),
    );
  }
}
