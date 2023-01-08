import 'package:flutter/material.dart';
import 'package:portfolio/util/screen_break_points.dart';
import 'package:portfolio/widgets/about_me/about_me.dart';
import 'package:portfolio/widgets/contact_me.dart';
import 'package:portfolio/widgets/dashboard/dashboard_phone.dart';
import 'package:portfolio/widgets/dashboard/dashboard_up_phone.dart';
import 'package:portfolio/widgets/experiences.dart';
import 'package:portfolio/widgets/skills/skill_list.dart';

const _screens = [AboutMe(), SkillsList(), Experiences(), ContactMe()];

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= ScreenBreakPoints.phone.width) {
          return const DashboardPhone(screens: _screens);
        }
        return const DashboardUpPhone(screens: _screens);
      },
    );
  }
}
