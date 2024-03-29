import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/logic/selected_screen_cubit.dart';
import 'package:portfolio/logic/theme_storage_cubit.dart';
import 'package:portfolio/styles/colors.dart';
import 'package:portfolio/widgets/dashboard/color_picker.dart';
import 'package:portfolio/widgets/dashboard/screen_model.dart';
import 'package:portfolio/widgets/failure_widget.dart';

import 'expandable_fab.dart';

class DashboardPhone extends StatelessWidget {
  const DashboardPhone({
    Key? key,
    required this.screens,
  }) : super(key: key);

  final List<ScreenModel> screens;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedScreenCubit, int>(
      builder: (context, screenIndex) {
        return Scaffold(
          floatingActionButton: _fab(),
          bottomNavigationBar: _navigationBar(screenIndex, context),
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
                    _body(screenIndex),
                    const LinearProgressIndicator(),
                  ],
                );
              }
              return _body(screenIndex);
            },
          ),
        );
      },
    );
  }

  void _fetchThemeData(BuildContext context) =>
      context.read<ThemeStorageCubit>().fetchThemeData();

  Widget _body(int screenIndex) => screens[screenIndex].widget;

  NavigationBar _navigationBar(int screenIndex, BuildContext context) {
    return NavigationBar(
      selectedIndex: screenIndex,
      destinations: _destinations(),
      onDestinationSelected: (screenIndex) => _setScreen(context, screenIndex),
    );
  }

  Widget _fab() {
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

        return ExpandableFab(
          child: const Icon(Icons.menu),
          children: [
            FloatingActionButton.small(
              onPressed: () => _revertBrightness(context, isDark),
              child: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            ),
            FloatingActionButton.small(
              onPressed: () => showColorPicker(
                context,
                isDark: isDark,
                seedColor: seedColor,
              ),
              child: const Icon(Icons.color_lens),
            ),
          ],
        );
      },
    );
  }

  List<NavigationDestination> _destinations() {
    return screens.map(
      (screen) {
        return NavigationDestination(
          icon: Icon(screen.icon),
          label: screen.name,
        );
      },
    ).toList();
  }

  void _setScreen(BuildContext context, int screenIndex) {
    context.read<SelectedScreenCubit>().setScreen(screenIndex);
  }

  void _revertBrightness(BuildContext context, bool isDark) {
    context.read<ThemeStorageCubit>().setThemeBrightness(!isDark);
  }
}
