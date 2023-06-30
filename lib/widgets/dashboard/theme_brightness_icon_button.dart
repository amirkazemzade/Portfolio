import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/logic/theme_storage_cubit.dart';

class ThemeBrightnessIconButton extends StatelessWidget {
  const ThemeBrightnessIconButton({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _revertBrightness(context, isDark),
      icon: Icon(
        isDark ? Icons.light_mode : Icons.mode_night,
      ),
    );
  }

  void _revertBrightness(BuildContext context, bool isDark) =>
      context.read<ThemeStorageCubit>().setThemeBrightness(!isDark);
}
