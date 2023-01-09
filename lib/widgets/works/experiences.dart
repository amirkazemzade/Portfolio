import 'package:flutter/material.dart';
import 'package:portfolio/widgets/works/experience_card.dart';
import 'package:portfolio/widgets/works/experience_model.dart';

const _experiences = [
  ExperienceModel(
    companyName: 'Ryca',
    logoPath: 'images/200px/ryca-logo.jpg',
    date: 'Apr 2022 - Present',
    jobTitle: 'Junior Mobile Developer',
    topSkills: ['Flutter', 'PWA', 'Android'],
  ),
  ExperienceModel(
    companyName: 'Ryca',
    logoPath: 'images/200px/ryca-logo.jpg',
    date: 'Jan 2022 - Apr 2022',
    jobTitle: 'Flutter Internship',
    topSkills: ['Flutter', 'Android'],
  ),
];

class Experiences extends StatelessWidget {
  const Experiences({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: _experienceCards(),
    );
  }

  List<ExperienceCard> _experienceCards() {
    return _experiences.map((experience) {
      return ExperienceCard(experience: experience);
    }).toList();
  }
}
