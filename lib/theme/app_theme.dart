import 'package:flutter/material.dart';
import 'package:movie_x/styles/text_styles.dart';

ThemeData defaultAppTheme = ThemeData(
  brightness: Brightness.dark,
  textTheme: TextTheme(
    titleLarge: AppTextStyle.titleLarge,
    titleMedium: AppTextStyle.titleMedium,
    titleSmall: AppTextStyle.titleSmall,
    bodyMedium: AppTextStyle.bodyMedium,
    bodySmall: AppTextStyle.bodySmall,
  ),
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.amber,
    secondary: Colors.grey.shade700,
    inversePrimary: Colors.grey.shade100,
  ),
);
