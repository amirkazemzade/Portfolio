import 'package:flutter/material.dart';
import 'package:portfolio/util/screen_break_points.dart';
import 'package:portfolio/widgets/about_me/about_me.dart';
import 'package:portfolio/widgets/contact_me/contact_me.dart';
import 'package:portfolio/widgets/dashboard/dashboard_phone.dart';
import 'package:portfolio/widgets/dashboard/dashboard_up_phone.dart';
import 'package:portfolio/widgets/dashboard/screen_model.dart';
import 'package:portfolio/widgets/skills/skill_list.dart';
import 'package:portfolio/widgets/works/works.dart';

const _screens = [
  ScreenModel(
    name: 'About',
    icon: Icons.person,
    widget: AboutMe(),
  ),
  ScreenModel(
    name: 'Skills',
    icon: Icons.emoji_objects_outlined,
    widget: SkillsList(),
  ),
  ScreenModel(
    name: 'Works',
    icon: Icons.work_outline,
    widget: Works(),
  ),
  ScreenModel(
    name: 'Contact',
    icon: Icons.alternate_email,
    widget: ContactMe(),
  ),
];

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (MediaQuery.of(context).size.width <=
            ScreenBreakPoints.phone.width) {
          return const DashboardPhone(screens: _screens);
        }
        return const DashboardUpPhone(screens: _screens);
      },
    );
  }
}
