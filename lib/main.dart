import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/bloc/news_bloc/news_bloc.dart';
import 'package:news_app/bloc/news_bloc/news_event.dart';
import 'package:news_app/config/app_router.dart';
import 'package:news_app/models/country.dart';
import 'package:news_app/screens/home_screen/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/services/news_api_service.dart';
import 'bloc/search_news_bloc/search_news_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {

  await dotenv.load(fileName: "keys.env");
  runApp(
    RepositoryProvider(
      create: (context) => NewsApiService(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => NewsBloc(context.read<NewsApiService>())
              ..add(
                LoadTopHeadlinesForCountryEvent(
                  countryCode: Country.countries[0].code,
                ),
              ),
          ),
          BlocProvider(
            create: (context) => SearchNewsBloc(context.read<NewsApiService>()),
          ),
        ],
        child: MaterialApp(
          onGenerateRoute: AppRoute.onGenerateRoute,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: ThemeData(
            primaryColor: Colors.redAccent,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.redAccent,
            ),
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
