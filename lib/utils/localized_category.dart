

import 'package:flutter/material.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/utils/build_context_ext.dart';

String getLocalizedCategoryName(BuildContext context, String title) {
  if(title == Category.categories[0].name) {
    return context.localizations.top_headlines;
  }
  else if(title == Category.categories[1].name) {
    return context.localizations.sports;
  }
  else if(title == Category.categories[2].name) {
    return context.localizations.entertainment;
  }
  else if(title == Category.categories[3].name) {
    return context.localizations.business;
  }
  else if(title == Category.categories[4].name) {
    return context.localizations.science;
  }
  else if(title == Category.categories[5].name) {
    return context.localizations.technology;
  }
  else if(title == Category.categories[6].name) {
    return context.localizations.health;
  } else {
    throw Exception();
  }
}