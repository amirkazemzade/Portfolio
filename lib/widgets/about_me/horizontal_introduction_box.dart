import 'package:flutter/material.dart';
import 'package:portfolio/widgets/about_me/introduction_text.dart';
import 'package:portfolio/widgets/about_me/profile_avatar.dart';

class HorizontalIntroductionBox extends StatelessWidget {
  const HorizontalIntroductionBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: ProfileAvatar()),
        SizedBox(width: 32),
        Expanded(
          flex: 2,
          child: IntroductionText(),
        ),
      ],
    );
  }
}
