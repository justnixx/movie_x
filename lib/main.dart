import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_x/screens/home_screen.dart';
import 'package:movie_x/theme/app_theme.dart';

void main() async {
  await dotenv.load(fileName: '.env');

  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(Duration(seconds: 3)); // Simulate a 3-second delay

  runApp(const MovieX());
}

class MovieX extends StatelessWidget {
  const MovieX({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: defaultAppTheme,
      home: const HomeScreen(),
    );
  }
}
