import 'package:flutter/material.dart';
import 'package:portfolio/styles/dimensions.dart';
import 'package:portfolio/widgets/about_me/about_me_description.dart';
import 'package:portfolio/widgets/about_me/introduction_text.dart';
import 'package:portfolio/widgets/about_me/profile_avatar.dart';
import 'package:sizer/sizer.dart';

class ContentUpLaptop extends StatelessWidget {
  const ContentUpLaptop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding64,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: ProfileAvatar()),
              const SizedBox(width: 32),
              const Expanded(
                child: IntroductionText(fiveLine: true),
              ),
              SizedBox(
                height: 25.h,
                child: const VerticalDivider(width: 64, thickness: 8),
              ),
              const Expanded(
                flex: 2,
                child: AboutMeDescription(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
