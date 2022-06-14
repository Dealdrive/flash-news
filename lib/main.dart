import 'package:flutter/material.dart';
import 'package:news_app/screens/config/app_router.dart';
import 'package:news_app/screens/home_screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      onGenerateRoute: AppRoute.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      initialRoute: HomeScreen.routeName,
    )
  );
}



