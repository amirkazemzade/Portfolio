import 'package:flutter/material.dart';
import 'package:portfolio/styles/dimensions.dart';
import 'package:portfolio/widgets/works/projects.dart';

class ProjectsBox extends StatelessWidget {
  const ProjectsBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headline = Theme.of(context).textTheme.headlineMedium;
    return Column(
      children: [
        Text('Projects', style: headline),
        sizedBoxH8,
        const Projects(),
      ],
    );
  }
}
