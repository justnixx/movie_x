import 'package:flutter/material.dart';
import 'package:movie_x/components/app_header.dart';
import 'package:movie_x/constants/strings.dart';
import 'package:movie_x/screens/about_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader.build(
        context: context,
        title: AppStrings.settings,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 24,
              right: 24,
              left: 24,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .inversePrimary
                      .withOpacity(.2),
                  width: 1,
                ),
              ),
            ),
            child: ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
              trailing: const Icon(
                Icons.chevron_right_outlined,
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutScreen(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
