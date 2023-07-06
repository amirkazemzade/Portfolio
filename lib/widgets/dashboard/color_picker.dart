import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/logic/theme_storage_cubit.dart';
import 'package:portfolio/widgets/dashboard/app_color_picker.dart';

void showColorPicker(
  BuildContext context, {
  required final Color seedColor,
  required final bool isDark,
}) {
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
}

void _setSeedColor(BuildContext context, Color selectedColor) =>
    context.read<ThemeStorageCubit>().setThemeSeedColor(selectedColor.value);
