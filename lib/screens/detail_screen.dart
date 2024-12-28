import 'package:flutter/material.dart';
import 'package:movie_x/components/app_header.dart';
import 'package:movie_x/components/movie_poster.dart';
import 'package:movie_x/components/star_rating.dart';
import 'package:movie_x/models/movie.dart';
import 'package:movie_x/services/movie_service.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  final String mediaType;

  const DetailScreen({
    super.key,
    required this.id,
    required this.mediaType,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final movieService = MovieService();
  Movie? movie;

  @override
  void initState() {
    super.initState();

    fetchMovieDetail();
  }

  Future<Movie> fetchMovieDetail() async {
    return await movieService.getDetail(widget.mediaType, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader.build(
        context: context,
      ),
      body: FutureBuilder<Movie>(
        future: fetchMovieDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Error: ${snapshot.error}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.red[200],
                    ),
              ),
            );
          }

          final movie = snapshot.data!;

          return ListView(
            padding: const EdgeInsets.only(bottom: 60),
            children: [
              // Movie poster
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: MoviePoster(
                  imageUrl: movie.posterPath,
                  height: 600,
                ),
              ),

              // Movie details
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Movie title
                    Text(
                      movie.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),

                    // Space between elements
                    const SizedBox(
                      height: 8,
                    ),

                    // Movie rating
                    StarRating(movie: movie),

                    // Space between elements
                    const SizedBox(
                      height: 8,
                    ),

                    // Movie genres
                    Text(
                      movie.genres?.map((genre) => genre.name).join(', ') ??
                          'Unknown',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),

                    // Space between elements
                    const SizedBox(
                      height: 8,
                    ),

                    // Movie release year
                    Text(
                      'Year of Release: ${movie.year}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    // Space between elements
                    const SizedBox(
                      height: 12,
                    ),

                    // Movie overview
                    Text(
                      movie.overview,
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
