import 'package:equatable/equatable.dart';

class Skill extends Equatable {
  final String name;
  final String logoPath;
  final String? darkLogoPath;

  const Skill(this.name, this.logoPath, [this.darkLogoPath]);

  @override
  List<Object> get props => [name, logoPath];
}
