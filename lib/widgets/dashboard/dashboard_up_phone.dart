import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/logic/selected_screen_cubit.dart';
import 'package:portfolio/logic/theme_storage_cubit.dart';
import 'package:portfolio/styles/colors.dart';
import 'package:portfolio/widgets/dashboard/screen_model.dart';
import 'package:portfolio/widgets/dashboard/theme_brightness_icon_button.dart';
import 'package:portfolio/widgets/dashboard/theme_seed_color_picker.dart';
import 'package:portfolio/widgets/failure_widget.dart';

class DashboardUpPhone extends StatelessWidget {
  const DashboardUpPhone({
    Key? key,
    required this.screens,
  }) : super(key: key);

  final List<ScreenModel> screens;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ThemeStorageCubit, ThemeStorageState>(
        builder: (context, state) {
          if (state is ThemeStorageFailure) {
            return Center(
              child: FailureWidget(
                errorMessage: state.error,
                onPressed: () => _fetchThemeData(context),
              ),
            );
          }
          if (state is ThemeStorageCubit) {
            return Stack(
              children: [
                _body(),
                const LinearProgressIndicator(),
              ],
            );
          }
          return _body();
        },
      ),
    );
  }

  BlocBuilder<SelectedScreenCubit, int> _body() {
    return BlocBuilder<SelectedScreenCubit, int>(
      builder: (context, screenIndex) {
        return Row(
          children: [
            NavigationRail(
              leading: _themeSwitchButton(),
              groupAlignment: 0,
              destinations: _destinations(),
              labelType: NavigationRailLabelType.all,
              selectedIndex: screenIndex,
              onDestinationSelected: (screenIndex) =>
                  _setScreen(context, screenIndex),
            ),
            Expanded(child: screens[screenIndex].widget),
          ],
        );
      },
    );
  }

  BlocBuilder<ThemeStorageCubit, ThemeStorageState> _themeSwitchButton() {
    return BlocBuilder<ThemeStorageCubit, ThemeStorageState>(
      builder: (context, state) {
        bool isDark = false;
        Color seedColor = roseColor;

        if (state is ThemeStorageSuccess && state.isDark != null) {
          isDark = state.isDark!;
        }
        if (state is ThemeStorageSuccess && state.seedColor != null) {
          seedColor = Color(state.seedColor!);
        }
        return Column(
          children: [
            ThemeBrightnessIconButton(isDark: isDark),
            ThemeSeedColorPicker(
              seedColor: seedColor,
              isDark: isDark,
            ),
          ],
        );
      },
    );
  }

  List<NavigationRailDestination> _destinations() {
    return screens.map(
      (screen) {
        return NavigationRailDestination(
          icon: Icon(screen.icon),
          label: Text(screen.name),
        );
      },
    ).toList();
  }

  void _fetchThemeData(BuildContext context) =>
      context.read<ThemeStorageCubit>().fetchThemeData();

  void _setScreen(BuildContext context, int screenIndex) =>
      context.read<SelectedScreenCubit>().setScreen(screenIndex);
}
