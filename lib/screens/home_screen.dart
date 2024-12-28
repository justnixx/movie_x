import 'package:flutter/material.dart';
import 'package:movie_x/components/app_bottom_nav.dart';
import 'package:movie_x/screens/settings_screen.dart';
import 'package:movie_x/screens/latest_screen.dart';
import 'package:movie_x/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> screenOptions = [
    const LatestScreen(),
    const SearchScreen(),
    const SettingsScreen(),
  ];

  void handleTabChange(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenOptions[selectedIndex],
      bottomNavigationBar: AppBottomNav(
        selectedIndex: selectedIndex,
        onTabChange: (index) => handleTabChange(index),
      ),
    );
  }
}
