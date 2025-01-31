import 'package:flutter/material.dart';
import 'package:movie_x/components/app_header.dart';
import 'package:movie_x/components/movie_card.dart';
import 'package:movie_x/constants/strings.dart';
import 'package:movie_x/models/movie.dart';
import 'package:movie_x/services/movie_service.dart';
import 'package:movie_x/styles/text_styles.dart';

class LatestScreen extends StatefulWidget {
  const LatestScreen({super.key});

  @override
  State<LatestScreen> createState() => _LatestScreenState();
}

class _LatestScreenState extends State<LatestScreen> {
  final movieService = MovieService();
  List<Movie> trendingTv = [];
  List<Movie> latestMovies = [];
  bool isLoadingTv = true;
  bool isLoadingMovies = true;

  @override
  void initState() {
    super.initState();
    fetchTvShows();
    fetchMovies();
  }

  // Fetch trending TV shows from the service
  Future<void> fetchTvShows() async {
    final shows = await movieService.getTrendingTvShows();
    setState(() {
      trendingTv = shows;
      isLoadingTv = false;
    });
  }

  // Fetch latest movies from the service
  Future<void> fetchMovies() async {
    final movies = await movieService.getLatestMovies();
    setState(() {
      latestMovies = movies;
      isLoadingMovies = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader.build(context: context, title: ''),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _renderTvShows(),
            _renderLatestMovies(),
          ],
        ),
      ),
    );
  }

  Widget _renderTvShows() {
    return Padding(
      padding: const EdgeInsets.only(right: 24, bottom: 20, left: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.trending,
            style: AppTextStyle.titleLarge,
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 330,
            child: isLoadingTv
                ? const Center(child: CircularProgressIndicator())
                : trendingTv.isEmpty
                    ? const Center(
                        child: Text(AppStrings.noTrendingTv),
                      )
                    : ListView.builder(
                        itemCount: trendingTv.length,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final currentShow = trendingTv[index];
                          return MovieCard(
                            movie: currentShow,
                            isFirstItem: index == 0,
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }

  Widget _renderLatestMovies() {
    return Padding(
      padding: const EdgeInsets.only(right: 24, bottom: 20, left: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.latest,
            style: AppTextStyle.titleLarge,
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 330,
            child: isLoadingMovies
                ? const Center(child: CircularProgressIndicator())
                : latestMovies.isEmpty
                    ? const Center(
                        child: Text(AppStrings.noLatestMovies),
                      )
                    : ListView.builder(
                        itemCount: latestMovies.length,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final currentMovie = latestMovies[index];
                          return MovieCard(
                            movie: currentMovie,
                            isFirstItem: index == 0,
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
