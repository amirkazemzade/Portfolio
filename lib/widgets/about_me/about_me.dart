import 'package:flutter/material.dart';
import 'package:portfolio/styles/dimensions.dart';
import 'package:portfolio/util/screen_break_points.dart';
import 'package:portfolio/widgets/about_me/about_me_down_laptop.dart';
import 'package:portfolio/widgets/about_me/content_up_laptop.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView(
          padding: padding64,
          shrinkWrap: true,
          children: [
            constraints.maxWidth < ScreenBreakPoints.laptop.width
                ? const ContentDownLaptop()
                : const ContentUpLaptop(),
          ],
        );
      },
    );
  }
}
