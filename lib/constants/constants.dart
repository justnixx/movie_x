import 'package:flutter_dotenv/flutter_dotenv.dart';

class MediaTypes {
  static const String tv = 'tv';
  static const String movie = 'movie';
  static const String person = 'person';
}

class AppConstants {
  static const String apiBaseUrl = 'https://api.themoviedb.org/3';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
  static const String imagePlaceHolderUrl = 'lib/assets/images/placeholder.png';
  static const String tmdbLogo = 'lib/assets/images/tmdb_blue_square.png';
  static var accessToken = dotenv.env['API_ACCESS_TOKEN'];
}
