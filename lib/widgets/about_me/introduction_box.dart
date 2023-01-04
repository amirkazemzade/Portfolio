import 'package:flutter/material.dart';
import 'package:portfolio/screen_break_points.dart';
import 'package:portfolio/widgets/about_me/horizontal_introduction_box.dart';
import 'package:portfolio/widgets/about_me/vertical_introduction_box.dart';

class IntroductionBox extends StatelessWidget {
  const IntroductionBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return constraints.maxWidth > ScreenBreakPoints.phone.width
          ? const HorizontalIntroductionBox()
          : const VerticalIntroductionBox();
    });
  }
}
