import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/bloc/news_bloc.dart';
import 'package:news_app/bloc/news_event.dart';
import 'package:news_app/config/app_router.dart';
import 'package:news_app/models/country.dart';
import 'package:news_app/screens/home_screen/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/services/news_api_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "keys.env");

  runApp(
    RepositoryProvider(
      create: (context) => NewsApiService(),
      child: BlocProvider(
        create: (context) => NewsBloc(context.read<NewsApiService>())
          ..add(
            LoadTopHeadlinesForCountryEvent(
              countryCode: Country.countries[0].code,
            ),
          ),
        child: MaterialApp(
          onGenerateRoute: AppRoute.onGenerateRoute,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.redAccent,
            colorScheme: ThemeData.light().colorScheme.copyWith(
                //secondary:
                ),
            backgroundColor: const Color(0xFFF9F9F9),
          ),
          initialRoute: HomeScreen.routeName,
        ),
      ),
    ),
  );
}
