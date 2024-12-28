import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_x/models/movie.dart';

class StarRating extends StatelessWidget {
  final Movie movie;
  const StarRating({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Rating: ${movie.voteAverage / 2} out of 5 stars',
      child: Row(
        children: [
          // Rating text
          Text(
            (movie.voteAverage / 2).toStringAsFixed(1),
            style: Theme.of(context).textTheme.bodyMedium,
          ),

          // Horizontal space
          const SizedBox(
            width: 4,
          ),

          // Star rating bar
          RatingBarIndicator(
            rating: movie.voteAverage / 2,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            unratedColor: Theme.of(context).colorScheme.secondary,
            itemCount: 5,
            itemSize: 20,
            direction: Axis.horizontal,
          ),
        ],
      ),
    );
  }
}
