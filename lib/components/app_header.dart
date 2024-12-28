import 'package:flutter/material.dart';

class AppHeader {
  static AppBar build({
    required BuildContext context,
    String? title,
    PreferredSizeWidget? bottom,
    Color background = Colors.transparent,
    Color foreground = Colors.white,
  }) {
    return AppBar(
      foregroundColor: foreground,
      backgroundColor: background,
      elevation: 0,
      title: title == null
          ? null
          : Row(
              children: [
                Text(
                  title,
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
      bottom: bottom,
    );
  }
}
