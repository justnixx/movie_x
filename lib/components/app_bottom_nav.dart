import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movie_x/constants/strings.dart';

class AppBottomNav extends StatelessWidget {
  final int selectedIndex;
  final void Function(int index)? onTabChange;

  const AppBottomNav(
      {super.key, required this.selectedIndex, this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 12),
      child: GNav(
        color: Colors.white,
        activeColor: Theme.of(context).colorScheme.primary,
        gap: 8,
        tabs: const [
          GButton(
            icon: Icons.home_outlined,
            text: AppStrings.home,
          ),
          GButton(
            icon: Icons.search_outlined,
            text: AppStrings.search,
          ),
          GButton(
            icon: Icons.settings_outlined,
            text: AppStrings.settings,
          )
        ],
        selectedIndex: selectedIndex,
        onTabChange: onTabChange,
      ),
    );
  }
}
