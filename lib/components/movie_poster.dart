import 'package:flutter/material.dart';
import 'package:movie_x/constants/constants.dart';

class MoviePoster extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final void Function()? onTap;
  const MoviePoster({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Poster of the movie',
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: FadeInImage.assetNetwork(
            placeholder: AppConstants.imagePlaceHolderUrl,
            image: imageUrl,
            fit: BoxFit.cover,
            width: width,
            height: height,
            imageErrorBuilder: (context, error, stackTrace) => Image.asset(
              AppConstants.imagePlaceHolderUrl,
              fit: BoxFit.cover,
              width: width,
              height: height,
            ),
          ),
        ),
      ),
    );
  }
}
