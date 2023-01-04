import 'package:flutter/material.dart';
import 'package:portfolio/screen_break_points.dart';
import 'package:portfolio/widgets/about_me/about_me_down_laptop.dart';
import 'package:portfolio/widgets/about_me/content_up_laptop.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.all(64),
          child: constraints.maxWidth < ScreenBreakPoints.laptop.width
              ? const ContentUnderLaptop()
              : const ContentUpLaptop(),
        );
      },
    );
  }
}
