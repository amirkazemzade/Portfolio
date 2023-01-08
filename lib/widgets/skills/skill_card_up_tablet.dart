import 'package:flutter/material.dart';
import 'package:portfolio/styles/dimensions.dart';
import 'package:portfolio/widgets/skills/skill.dart';
import 'package:portfolio/widgets/skills/skill_logo.dart';

class SkillCardUpTablet extends StatelessWidget {
  const SkillCardUpTablet({
    Key? key,
    required this.skill,
  }) : super(key: key);

  final Skill skill;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Column(
        children: [
          Flexible(
            flex: 4,
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
