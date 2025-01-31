import 'package:flutter/material.dart';
import 'package:movie_x/components/movie_poster.dart';
import 'package:movie_x/components/star_rating.dart';
import 'package:movie_x/models/movie.dart';
import 'package:movie_x/screens/detail_screen.dart';
import 'package:movie_x/utils/string_utils.dart';

class DetailedMovieCard extends StatelessWidget {
  final Movie movie;
  const DetailedMovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
        left: 20,
        right: 20,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Movie poster
          MoviePoster(
            imageUrl: movie.posterPath,
            height: 137,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  id: movie.id,
                  mediaType: movie.mediaType,
                ),
              ),
            ),
          ),

          // Horizontal spacing between the poster and details
          const SizedBox(
            width: 12,
          ),

          // Movie details (title and overview)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Movie title
                Text(
                  movie.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall,
                ),

                // Vertical spacing between title and overview
                const SizedBox(
                  height: 12,
                ),

                // Movie overview (truncated)
                Text(
                  truncateTo(text: movie.overview, to: 120),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                // Star rating
                StarRating(movie: movie),
              ],
            ),
          )
        ],
      ),
    );
  }
}
