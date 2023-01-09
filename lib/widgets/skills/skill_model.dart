import 'package:equatable/equatable.dart';

class SkillModel extends Equatable {
  final String name;
  final String logoPath;
  final String? darkLogoPath;

  const SkillModel(this.name, this.logoPath, [this.darkLogoPath]);

  @override
  List<Object> get props => [name, logoPath];
}
