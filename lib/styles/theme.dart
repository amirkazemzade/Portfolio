import 'package:flutter/material.dart';

class DynamicTheme extends StatelessWidget {
  const DynamicTheme({
    Key? key,
    required this.isDark,
    required this.colorSeed,
    required this.child,
  }) : super(key: key);

  final bool isDark;
  final Color colorSeed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: buildThemeData(
        isDark: isDark,
        colorSeed: colorSeed,
      ),
      child: child,
    );
  }
}

ThemeData buildThemeData({required bool isDark, required Color colorSeed}) {
  return ThemeData(
    useMaterial3: true,
    brightness: isDark ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorSeed,
  );
}
