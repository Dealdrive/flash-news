import 'package:flutter_dotenv/flutter_dotenv.dart';

final String apiKey = dotenv.env["API_KEY"] as String;

const String baseUrl = "https://newsapi.org/v2";