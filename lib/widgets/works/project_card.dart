import 'package:flutter/material.dart';
import 'package:portfolio/util/screen_break_points.dart';
import 'package:portfolio/widgets/works/project_content_phone.dart';
import 'package:portfolio/widgets/works/project_content_up_phone.dart';
import 'package:portfolio/widgets/works/project_model.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({Key? key, required this.project}) : super(key: key);

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > ScreenBreakPoints.phone.width) {
          return ProjectContentUpPhone(project: project);
        }
        return ProjectContentPhone(project: project);
      }),
    );
  }
}
