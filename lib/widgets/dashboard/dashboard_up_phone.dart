import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/logic/selected_screen_cubit.dart';
import 'package:portfolio/logic/theme_brightness_cubit.dart';
import 'package:portfolio/util/util.dart';
import 'package:portfolio/widgets/dashboard/screen_model.dart';

class DashboardUpPhone extends StatelessWidget {
  const DashboardUpPhone({
    Key? key,
    required this.screens,
  }) : super(key: key);

  final List<ScreenModel> screens;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SelectedScreenCubit, int>(
        builder: (context, screenIndex) {
          return Row(
            children: [
              NavigationRail(
                leading: BlocConsumer<ThemeBrightnessCubit, bool>(
                  listener: (context, isDark) => writeDarkMode(isDark),
                  builder: (context, isDark) {
                    return IconButton(
                      onPressed: () => _revertBrightness(context),
                      icon: Icon(
                        isDark ? Icons.light_mode : Icons.mode_night,
                      ),
                    );
                  },
                ),
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
      ),
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

  void _setScreen(BuildContext context, int screenIndex) {
    context.read<SelectedScreenCubit>().setScreen(screenIndex);
  }

  void _revertBrightness(BuildContext context) {
    context.read<ThemeBrightnessCubit>().revertBrightness();
  }
}
