import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/logic/selected_screen_cubit.dart';
import 'package:portfolio/logic/theme_brightness_cubit.dart';
import 'package:portfolio/widgets/about_me.dart';
import 'package:portfolio/widgets/contact_me.dart';
import 'package:portfolio/widgets/experiences.dart';
import 'package:portfolio/widgets/skills.dart';

const _screens = [AboutMe(), Skills(), Experiences(), ContactMe()];

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SelectedScreenCubit, int>(
        builder: (context, screenIndex) {
          return Row(
            children: [
              NavigationRail(
                leading: IconButton(
                  onPressed: () => _revertBrightness(context),
                  icon: const Icon(Icons.sunny),
                ),
                groupAlignment: 0,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.person),
                    label: Text("About"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.emoji_objects_outlined),
                    label: Text("Skills"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.work_outline),
                    label: Text("Work"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.alternate_email),
                    label: Text("Contact"),
                  ),
                ],
                labelType: NavigationRailLabelType.all,
                selectedIndex: screenIndex,
                onDestinationSelected: (screenIndex) =>
                    _setScreen(context, screenIndex),
              ),
              Expanded(child: _screens[screenIndex]),
            ],
          );
        },
      ),
    );
  }

  void _setScreen(BuildContext context, int screenIndex) {
    context.read<SelectedScreenCubit>().setScreen(screenIndex);
  }

  void _revertBrightness(BuildContext context) {
    context.read<ThemeBrightnessCubit>().revertBrightness();
  }
}
