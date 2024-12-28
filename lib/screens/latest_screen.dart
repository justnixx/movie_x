import 'package:flutter/material.dart';
import 'package:movie_x/components/app_header.dart';
import 'package:movie_x/components/movie_card.dart';
import 'package:movie_x/components/tv_card.dart';
import 'package:movie_x/constants/strings.dart';
import 'package:movie_x/models/movie.dart';
import 'package:movie_x/services/movie_service.dart';

class LatestScreen extends StatefulWidget {
  const LatestScreen({super.key});

  @override
  State<LatestScreen> createState() => _LatestScreenState();
}

class _LatestScreenState extends State<LatestScreen> {
  final movieService = MovieService();
  List<Movie> trendingTv = [];
  List<Movie> latestMovies = [];

  @override
  void initState() {
    super.initState();

    // Fetch trending TV shows and latest movies
    fetchTvShows();
    fetchMovies();
  }

  // Fetch trending TV shows from the service
  Future<void> fetchTvShows() async {
    final shows = await movieService.getTrendingTvShows();

    setState(() {
      trendingTv = shows;
    });
  }

  // Fetch latest movies from the service
  Future<void> fetchMovies() async {
    final movies = await movieService.getLatestMovies();

    setState(() {
      latestMovies = movies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader.build(
        context: context,
        title: AppStrings.trending,
      ),
      body: Column(
        children: [
          // Section for trending TV shows
          Expanded(
            flex: 1,
            child: trendingTv.isEmpty
                // Show a loading indicator if data is not available
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                // Display the horizontal list of trending TV shows
                : ListView.builder(
                    itemCount: trendingTv.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final currentShow = trendingTv[index];

                      return TvCard(tvShow: currentShow);
                    },
                  ),
          ),

          // Section for latest movies
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Heading
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    AppStrings.latest,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),

                // List of latest movies
                Expanded(
                  child: latestMovies.isEmpty
                      // Show a loading indicator if data is not available
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      // Display the vertical list of latest movies
                      : ListView.builder(
                          itemCount: latestMovies.length,
                          itemBuilder: (context, index) {
                            final currentMovie = latestMovies[index];

                            return MovieCard(movie: currentMovie);
                          },
                        ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
