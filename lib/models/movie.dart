import 'package:movie_x/constants/constants.dart';
import 'package:movie_x/models/genre.dart';

class Movie {
  int id;
  String title;
  String overview;
  double voteAverage;
  int voteCount;
  String mediaType;
  String posterPath;
  List<Genre>? genres;
  String? year;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.voteCount,
    required this.mediaType,
    required this.posterPath,
    this.genres,
    this.year,
  });

  // Movie.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       title = json['title'] ?? json['name'],
  //       overview = json['overview'] ?? '',
  //       voteAverage = json['vote_average'] ?? 0.0,
  //       voteCount = json['vote_count'] ?? 0,
  //       mediaType = json['media_type'] ?? '',
  //       posterPath = json['poster_path'] != null
  //           ? AppConstants.imageBaseUrl + json['poster_path']
  //           : AppConstants.imagePlaceHolderUrl;

  factory Movie.fromJson(Map<String, dynamic> json) {
    final List genresJson = json['genres'] ?? [];
    final List<Genre> genres = [];
    String year;

    for (var genre in genresJson) {
      genres.add(Genre.fromJson(genre));
    }

    if (json['first_air_date'] != null) {
      year = json['first_air_date'].toString().split('-').first;
    } else {
      year = json['release_date'].toString().split('-').first;
    }

    return Movie(
      id: json['id'],
      title: json['title'] ?? json['name'],
      overview: json['overview'] ?? '',
      voteAverage: json['vote_average'] ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
      mediaType: json['media_type'] ?? '',
      posterPath: json['poster_path'] != null
          ? AppConstants.imageBaseUrl + json['poster_path']
          : AppConstants.imagePlaceHolderUrl,
      genres: genres,
      year: year,
    );
  }
}
