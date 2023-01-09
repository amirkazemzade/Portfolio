import 'package:equatable/equatable.dart';

class ExperienceModel extends Equatable {
  final String companyName;
  final String logoPath;
  final String date;
  final String jobTitle;
  final List<String> topSkills;

  const ExperienceModel({
    required this.companyName,
    required this.logoPath,
    required this.date,
    required this.jobTitle,
    this.topSkills = const [],
  });

  @override
  List<Object> get props => [companyName, logoPath, date, jobTitle, topSkills];
}
