import 'package:flutter/material.dart';
import 'package:portfolio/styles/dimensions.dart';
import 'package:portfolio/widgets/works/experiences_box.dart';
import 'package:portfolio/widgets/works/projects_box.dart';

class WorksDownTablet extends StatelessWidget {
  const WorksDownTablet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding16,
      child: Column(
        children: [
          const ExperiencesBox(),
          sizedBoxH32,
          const ProjectsBox(),
        ]
            .map(
              (e) => Align(
                alignment: Alignment.center,
                child: e,
              ),
            )
            .toList(),
      ),
    );
  }
}
