import 'package:flutter/material.dart';
import 'package:portfolio/styles/colors.dart';

// Light Themes
final redLightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  colorSchemeSeed: darkRedColor,
);
final greenLightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  colorSchemeSeed: darkGreenColor,
);
final blueLightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  colorSchemeSeed: blueColor,
);
final yellowLightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  colorSchemeSeed: kiwiColor,
);

// Dark Themes
final redDarkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorSchemeSeed: roseColor,
);
final greenDarkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorSchemeSeed: limeColor,
);
final blueDarkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorSchemeSeed: lightBlueColor,
);
final yellowDarkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorSchemeSeed: tanColor,
);

final _lightThemes = [
  redLightTheme,
  greenLightTheme,
  blueLightTheme,
  yellowLightTheme,
];

final _darkThemes = [
  redDarkTheme,
  greenDarkTheme,
  blueDarkTheme,
  yellowDarkTheme,
];

class DynamicTheme extends StatelessWidget {
  const DynamicTheme(
      {Key? key,
      required this.isDark,
      required this.themeIndex,
      required this.child})
      : super(key: key);

  final bool isDark;
  final int themeIndex;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _theme(),
      child: child,
    );
  }

  ThemeData _theme() {
    if (isDark) {
      return _darkThemes[themeIndex];
    }
    return _lightThemes[themeIndex];
  }
}
