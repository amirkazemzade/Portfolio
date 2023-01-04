import 'package:flutter/material.dart';
import 'package:portfolio/widgets/about_me/introduction_text.dart';
import 'package:portfolio/widgets/about_me/profile_avatar.dart';

class VerticalIntroductionBox extends StatelessWidget {
  const VerticalIntroductionBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        ProfileAvatar(),
        SizedBox(height: 16),
        IntroductionText(fourLine: true),
      ],
    );
  }
}
