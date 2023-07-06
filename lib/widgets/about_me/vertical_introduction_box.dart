import 'package:flutter/material.dart';
import 'package:portfolio/widgets/about_me/introduction_text.dart';
import 'package:portfolio/widgets/about_me/profile_avatar.dart';

class VerticalIntroductionBox extends StatelessWidget {
  const VerticalIntroductionBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProfileAvatar(),
        SizedBox(height: 16),
        IntroductionText(fiveLine: true),
      ],
    );
  }
}
