import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/logic/selected_screen_cubit.dart';
import 'package:portfolio/logic/theme_brightness_cubit.dart';

class DashboardPhone extends StatelessWidget {
  const DashboardPhone({
    Key? key,
    required this.screens,
  }) : super(key: key);

  final List<Widget> screens;

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
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.person),
                label: 'About',
              ),
              NavigationDestination(
                icon: Icon(Icons.emoji_objects_outlined),
                label: 'Skills',
              ),
              NavigationDestination(
                icon: Icon(Icons.work_outline),
                label: 'Work',
              ),
              NavigationDestination(
                icon: Icon(Icons.alternate_email),
                label: 'Contact',
              ),
            ],
            onDestinationSelected: (screenIndex) =>
                _setScreen(context, screenIndex),
          ),
          body: screens[screenIndex],
        );
      },
    );
  }

  void _setScreen(BuildContext context, int screenIndex) {
    context.read<SelectedScreenCubit>().setScreen(screenIndex);
  }

  void _revertBrightness(BuildContext context) {
    context.read<ThemeBrightnessCubit>().revertBrightness();
  }
}
