import 'package:flutter/material.dart';
import 'package:portfolio/styles/dimensions.dart';
import 'package:portfolio/widgets/works/experiences_box.dart';
import 'package:portfolio/widgets/works/projects_box.dart';

class WorksUpTablet extends StatelessWidget {
  const WorksUpTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: padding64,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: ExperiencesBox()),
          sizedBoxW16,
          Expanded(child: ProjectsBox()),
        ],
      ),
    );
  }
}
