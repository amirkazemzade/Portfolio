import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:portfolio/styles/theme.dart';

class AppColorPicker extends StatefulWidget {
  const AppColorPicker({
    super.key,
    required this.seedColor,
    required this.onColorChanged,
    required this.isDark,
  });

  final Color seedColor;
  final bool isDark;
  final ValueChanged<Color> onColorChanged;

  @override
  State<AppColorPicker> createState() => _AppColorPickerState();
}

class _AppColorPickerState extends State<AppColorPicker> {
  late Color currentColor = widget.seedColor;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: buildThemeData(
        isDark: widget.isDark,
        colorSeed: currentColor,
      ),
      child: AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: currentColor,
            onColorChanged: (value) {
              setState(() {
                currentColor = value;
              });
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              widget.onColorChanged(currentColor);
              Navigator.of(context).pop();
            },
            child: const Text('Apply'),
          )
        ],
      ),
    );
  }
}
