import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/logic/selected_screen_cubit.dart';
import 'package:portfolio/logic/theme_brightness_cubit.dart';
import 'package:portfolio/widgets/dashboard/screen_model.dart';

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
          floatingActionButton: BlocBuilder<ThemeBrightnessCubit, bool>(
            builder: (context, isDark) {
              return FloatingActionButton(
                onPressed: () => _revertBrightness(context),
                child: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
              );
            },
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: screenIndex,
            destinations: _destinations(),
            onDestinationSelected: (screenIndex) =>
                _setScreen(context, screenIndex),
          ),
          body: screens[screenIndex].widget,
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

  void _revertBrightness(BuildContext context) {
    context.read<ThemeBrightnessCubit>().revertBrightness();
  }
}
