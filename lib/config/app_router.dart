import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen/home_screen.dart';
import 'package:news_app/screens/search_screen/search_screen.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: settings,
        );
      case SearchScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => SearchScreen(
            searchQuery: settings.arguments as String,
          ),
          settings: settings,
        );
      default:
        return _errorRoute(settings);
    }
  }

  static _errorRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text("Error route"),
        ),
      ),
      settings: settings,
    );
  }
}
