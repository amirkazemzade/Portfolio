import 'package:flutter/material.dart';
import 'package:portfolio/styles/dimensions.dart';
import 'package:portfolio/widgets/skills/skill_logo.dart';
import 'package:portfolio/widgets/skills/skill_model.dart';

class SkillCardPhone extends StatelessWidget {
  const SkillCardPhone({
    Key? key,
    required this.skill,
  }) : super(key: key);

  final SkillModel skill;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: SizedBox(
            width: 50,
            height: 50,
            child: SkillLogo(skill: skill),
          ),
        ),
        sizedBoxW16,
        Expanded(
          flex: 5,
          child: Text(
            skill.name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
