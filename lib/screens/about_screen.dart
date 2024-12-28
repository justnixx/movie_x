import 'package:flutter/material.dart';
import 'package:movie_x/components/app_header.dart';
import 'package:movie_x/constants/constants.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader.build(
        context: context,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Movie X',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  '.',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'Developed with ❤️\nby ℵi✗✗',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('GitHub: @justnixx\nYouTube: @nomagix'),
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              AppConstants.tmdbLogo,
              height: 120,
            ),
          ],
        ),
      ),
    );
  }
}
