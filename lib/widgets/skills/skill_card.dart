import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:portfolio/styles/dimensions.dart';
import 'package:portfolio/util/screen_break_points.dart';
import 'package:portfolio/widgets/skills/skill_card_phone.dart';
import 'package:portfolio/widgets/skills/skill_card_tablet.dart';
import 'package:portfolio/widgets/skills/skill_card_up_tablet.dart';
import 'package:portfolio/widgets/skills/skill_model.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({
    Key? key,
    required this.skill,
  }) : super(key: key);

  final SkillModel skill;

  @override
  Widget build(BuildContext context) {
    return HoverWidget(
      onHover: (event) {},
      hoverChild: Transform.scale(
        scale: 1.03,
        child: Card(
          elevation: 10,
          child: Padding(
            padding: padding4,
            child: SkillCardContent(skill: skill),
          ),
        ),
      ),
      child: Padding(
        padding: padding4,
        child: Card(
          child: SkillCardContent(skill: skill),
        ),
      ),
    );
  }
}

class SkillCardContent extends StatelessWidget {
  const SkillCardContent({
    Key? key,
    required this.skill,
  }) : super(key: key);

  final SkillModel skill;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding8,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (MediaQuery.of(context).size.width <=
              ScreenBreakPoints.phone.width) {
            return SkillCardPhone(skill: skill);
          }
          if (MediaQuery.of(context).size.width <=
              ScreenBreakPoints.tablet.width) {
            return SkillCardTablet(skill: skill);
          }
          return SkillCardUpTablet(skill: skill);
        },
      ),
    );
  }
}
