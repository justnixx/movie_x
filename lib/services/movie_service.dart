import 'package:movie_x/constants/constants.dart';
import 'package:movie_x/models/movie.dart';
import 'package:movie_x/services/api_service.dart';

class MovieService {
  // Initialize the API service with base URL and headers
  final _api = ApiService(
    baseUrl: AppConstants.apiBaseUrl,
    headers: {
      'accept': 'application/json',
      'Authorization': 'Bearer ${AppConstants.accessToken}',
    },
  );

  // Fetch trending TV shows from the API
  Future<List<Movie>> getTrendingTvShows() async {
    final List<Movie> shows = [];

    final jsonBody = await _api.get('/trending/tv/day');
    final List results = jsonBody['results'];

    for (var tv in results) {
      shows.add(Movie.fromJson(tv));
    }

    return shows;
  }

  // Fetch latest movies from the API
  Future<List<Movie>> getLatestMovies() async {
    final List<Movie> movies = [];

    final jsonBody = await _api.get('/trending/movie/day');
    final List results = jsonBody['results'];

    for (var tv in results) {
      movies.add(Movie.fromJson(tv));
    }

    return movies;
  }

  // Search
  Future<List<Movie>> searchMulti(String query) async {
    final List<Movie> moviesOrShows = [];

    final jsonBody = await _api.get('/search/multi?query=$query');
    final List results = jsonBody['results'];

    for (var movieOrShow in results) {
      if (movieOrShow['media_type'] != MediaTypes.person) {
        moviesOrShows.add(Movie.fromJson(movieOrShow));
      }
    }

    return moviesOrShows;
  }

  // Tv or movie detail
  Future<Movie> getDetail(String mediaType, int id) async {
    Movie movie;

    if (mediaType == MediaTypes.tv) {
      final jsonBody = await _api.get('/tv/$id');
      movie = Movie.fromJson(jsonBody);
    } else {
      final jsonBody = await _api.get('/movie/$id');
      movie = Movie.fromJson(jsonBody);
    }

    return movie;
  }
}
