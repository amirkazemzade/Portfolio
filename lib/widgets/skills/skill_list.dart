import 'package:flutter/material.dart';
import 'package:portfolio/styles/dimensions.dart';
import 'package:portfolio/util/screen_break_points.dart';
import 'package:portfolio/widgets/skills/skill_card.dart';
import 'package:portfolio/widgets/skills/skill_model.dart';

final _specialistSkills = [
  const SkillModel(
    'Android',
    'images/200px/android-logo.png',
  ),
  const SkillModel(
    'Kotlin',
    'images/200px/kotlin-logo.png',
  ),
  const SkillModel(
    'Flutter',
    'images/200px/flutter-logo.png',
  ),
  const SkillModel(
    'Jetpack Compose',
    'images/200px/jetpack-compose-logo.png',
  ),
  const SkillModel(
    'Material Design 3',
    'images/200px/material-design-3-logo.png',
  ),
  const SkillModel(
    'Github',
    'images/200px/github-logo-black.png',
    'images/200px/github-logo-white.png',
  ),
  const SkillModel(
    'SQL',
    'images/200px/sql-logo.png',
  ),
];

final _averageSkills = [
  const SkillModel(
    'Compose Multiplatform',
    'images/200px/compose-multiplatform-logo.png',
  ),
  const SkillModel(
    'Github Actions',
    'images/200px/github-actions-logo.png',
  ),
  const SkillModel(
    'Agile Development',
    'images/200px/agile-logo.png',
  ),
];

final _beginnerSkills = [
  const SkillModel(
    'KMM',
    'images/200px/kmm-logo.png',
  ),
  const SkillModel(
    'Socket Programming',
    'images/200px/socket-logo.png',
  ),
  const SkillModel(
    'Web Responsive Layout',
    'images/200px/responsive-logo.png',
  ),
];

class SkillsList extends StatelessWidget {
  const SkillsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var headerStyle = Theme.of(context).textTheme.headlineMedium;
    return LayoutBuilder(builder: (context, constraints) {
      return ListView(
        padding: _padding(constraints),
        shrinkWrap: true,
        children: [
          Text('Best With', style: headerStyle),
          sizedBoxH8,
          Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: _specialistSkills
                .map((skill) => SkillCard(skill: skill))
                .toList(),
          ),
          sizedBoxH32,
          Text('Good At', style: headerStyle),
          sizedBoxH8,
          Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children:
                _averageSkills.map((skill) => SkillCard(skill: skill)).toList(),
          ),
          sizedBoxH32,
          Text('Learning', style: headerStyle),
          sizedBoxH8,
          Wrap(
            alignment: WrapAlignment.center,
            // runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: _beginnerSkills
                .map((skill) => SkillCard(skill: skill))
                .toList(),
          ),
        ]
            .map(
              (e) => Align(
                alignment: Alignment.center,
                child: e,
              ),
            )
            .toList(),
      );
    });
  }

  EdgeInsets _padding(BoxConstraints constraints) {
    if (constraints.maxWidth <= ScreenBreakPoints.phone.width) {
      return padding16;
    }
    if (constraints.maxWidth <= ScreenBreakPoints.tablet.width) {
      return padding32;
    }
    return padding64;
  }
}
