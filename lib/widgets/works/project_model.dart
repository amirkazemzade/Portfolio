import 'package:equatable/equatable.dart';

class ProjectModel extends Equatable {
  final String title;
  final String date;
  final String description;
  final String language;
  final String framework;
  final List<String> platforms;
  final String srcIconPath;
  final String? srcDarkIconPath;
  final String srcURL;

  const ProjectModel({
    required this.title,
    required this.date,
    required this.description,
    required this.language,
    required this.framework,
    required this.platforms,
    required this.srcIconPath,
    this.srcDarkIconPath,
    required this.srcURL,
  });

  @override
  List<Object?> get props => [
        title,
        date,
        description,
        language,
        framework,
        platforms,
        srcIconPath,
        srcDarkIconPath,
        srcURL,
      ];
}
