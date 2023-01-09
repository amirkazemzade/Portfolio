import 'package:flutter/material.dart';
import 'package:portfolio/styles/dimensions.dart';
import 'package:portfolio/util/screen_break_points.dart';
import 'package:portfolio/widgets/works/experience_content_phone.dart';
import 'package:portfolio/widgets/works/experience_content_up_phone.dart';
import 'package:portfolio/widgets/works/experience_model.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({
    Key? key,
    required this.experience,
  }) : super(key: key);

  final ExperienceModel experience;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: padding8,
        child: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > ScreenBreakPoints.phone.width) {
            return ExperienceContentUpPhone(experience: experience);
          }
          return ExperienceContentPhone(experience: experience);
        }),
      ),
    );
  }
}
