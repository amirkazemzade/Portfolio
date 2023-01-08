import 'package:flutter/material.dart';
import 'package:portfolio/styles/dimensions.dart';
import 'package:portfolio/widgets/skills/skill.dart';
import 'package:portfolio/widgets/skills/skill_logo.dart';

class SkillCardTablet extends StatelessWidget {
  const SkillCardTablet({
    Key? key,
    required this.skill,
  }) : super(key: key);

  final Skill skill;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      height: 90,
      child: Column(
        children: [
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: SkillLogo(skill: skill),
          ),
          sizedBoxH4,
          Flexible(
            child: FittedBox(
              child: Text(
                skill.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
