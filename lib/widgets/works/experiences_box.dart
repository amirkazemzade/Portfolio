import 'package:flutter/material.dart';
import 'package:portfolio/styles/dimensions.dart';
import 'package:portfolio/widgets/works/experiences.dart';

class ExperiencesBox extends StatelessWidget {
  const ExperiencesBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headline = Theme.of(context).textTheme.headlineMedium;
    return Column(
      children: [
        Text('Experiences', style: headline),
        sizedBoxH8,
        const Experiences(),
      ],
    );
  }
}
