import 'package:flutter/material.dart';
import 'package:portfolio/widgets/dashboard/color_picker.dart';

class ThemeSeedColorPicker extends StatelessWidget {
  const ThemeSeedColorPicker({
    super.key,
    required this.seedColor,
    required this.isDark,
  });

  final Color seedColor;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showColorPicker(
          context,
          seedColor: seedColor,
          isDark: isDark,
        );
      },
      icon: const Icon(Icons.color_lens),
    );
  }
}

