import 'package:flutter/material.dart';
import 'package:portfolio/styles/dimensions.dart';
import 'package:portfolio/widgets/skills/skill.dart';
import 'package:portfolio/widgets/skills/skill_card.dart';

final _specialistSkills = [
  const Skill(
    'Android',
    'images/200px/android-logo.png',
  ),
  const Skill(
    'Kotlin',
    'images/200px/kotlin-logo.png',
  ),
  const Skill(
    'Flutter',
    'images/200px/flutter-logo.png',
  ),
  const Skill(
    'Jetpack Compose',
    'images/200px/jetpack-compose-logo.png',
  ),
  const Skill(
    'Github',
    'images/200px/github-logo-black.png',
    'images/200px/github-logo-white.png',
  ),
  const Skill(
    'SQL',
    'images/200px/sql-logo.png',
  ),
];

final _averageSkills = [
  const Skill(
    'Compose Multiplatform',
    'images/200px/compose-multiplatform-logo.png',
  ),
  const Skill(
    'Github Actions',
    'images/200px/github-actions-logo.png',
  ),
  const Skill(
    'Material Design 3',
    'images/200px/material-design-logo.png',
  ),
  const Skill(
    'Agile Development',
    'images/200px/agile-logo.png',
  ),
];
final _beginnerSkills = [
  const Skill(
    'KMM',
    'images/200px/kmm-logo.png',
  ),
  const Skill(
    'Socket Programming',
    'images/200px/socket-logo.png',
  ),
  const Skill(
    'Web Responsive Layout',
    'images/200px/responsive-logo.png',
  ),
];

class SkillsList extends StatelessWidget {
  const SkillsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var headerStyle = Theme.of(context).textTheme.headline4;
    return ListView(
      padding: padding64,
      shrinkWrap: true,
      children: [
        Text('Best With', style: headerStyle),
        sizedBoxH4,
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
        sizedBoxH4,
        Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children:
              _averageSkills.map((skill) => SkillCard(skill: skill)).toList(),
        ),
        sizedBoxH32,
        Text('Learning', style: headerStyle),
        sizedBoxH4,
        Wrap(
          alignment: WrapAlignment.center,
          // runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children:
              _beginnerSkills.map((skill) => SkillCard(skill: skill)).toList(),
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
  }
}
