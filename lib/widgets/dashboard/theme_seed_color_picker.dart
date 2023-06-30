import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/logic/theme_storage_cubit.dart';
import 'package:portfolio/widgets/dashboard/app_color_picker.dart';

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
        showDialog(
          context: context,
          builder: (dialogContext) {
            return AppColorPicker(
              seedColor: seedColor,
              isDark: isDark,
              onColorChanged: (value) {
                _setSeedColor(context, value);
              },
            );
          },
        );
      },
      icon: const Icon(Icons.color_lens),
    );
  }

  void _setSeedColor(BuildContext context, Color selectedColor) =>
      context.read<ThemeStorageCubit>().setThemeSeedColor(selectedColor.value);
}
