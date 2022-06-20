import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen/home_screen.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => const HomeScreen(), settings: settings);
      default:
        return _errorRoute(settings);
    }
  }

  static _errorRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text("Error route"),
        ),
      ),
      settings: settings,
    );
  }
}
