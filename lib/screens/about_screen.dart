import 'package:flutter/material.dart';
import 'package:movie_x/components/app_header.dart';
import 'package:movie_x/constants/constants.dart';
import 'package:movie_x/constants/strings.dart';
import 'package:movie_x/utils/url_util.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader.build(
        context: context,
        title: AppStrings.about,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => openUrl(AppConstants.devUrl),
              child: Text(
                'Developed with ❤️\nby ℵi✗✗',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
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
