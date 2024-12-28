import 'package:flutter/material.dart';
import 'package:movie_x/components/movie_poster.dart';
import 'package:movie_x/components/star_rating.dart';
import 'package:movie_x/models/movie.dart';
import 'package:movie_x/screens/detail_screen.dart';
import 'package:movie_x/utils/string_utils.dart';

class TvCard extends StatelessWidget {
  final Movie tvShow;
  const TvCard({super.key, required this.tvShow});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TV show poster
          MoviePoster(
            imageUrl: tvShow.posterPath,
            height: 273,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  id: tvShow.id,
                  mediaType: tvShow.mediaType,
                ),
              ),
            ),
          ),

          // Vertical spacing between poster and title
          const SizedBox(
            height: 12,
          ),

          // TV show title
          Text(
            truncateTo(text: tvShow.title),
            style: Theme.of(context).textTheme.titleSmall,
          ),

          // Star rating
          StarRating(movie: tvShow),
        ],
      ),
    );
  }
}
