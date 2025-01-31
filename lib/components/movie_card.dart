import 'package:flutter/material.dart';
import 'package:movie_x/components/movie_poster.dart';
import 'package:movie_x/components/star_rating.dart';
import 'package:movie_x/models/movie.dart';
import 'package:movie_x/screens/detail_screen.dart';
import 'package:movie_x/utils/string_utils.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final bool isFirstItem;
  const MovieCard({super.key, required this.movie, required this.isFirstItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: isFirstItem ? 0 : 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Movie poster
          MoviePoster(
            imageUrl: movie.posterPath,
            height: 273,
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

          // Vertical spacing between poster and title
          const SizedBox(
            height: 12,
          ),

          // Movie title
          Text(
            truncateTo(text: movie.title),
            style: Theme.of(context).textTheme.titleSmall,
          ),

          // Star rating
          StarRating(movie: movie),
        ],
      ),
    );
  }
}
