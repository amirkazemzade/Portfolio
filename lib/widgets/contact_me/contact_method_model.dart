import 'package:equatable/equatable.dart';

class ContactMethodModel extends Equatable {
  final String srcIconPath;
  final String? srcDarkIconPath;
  final String srcURL;

  const ContactMethodModel({
    required this.srcIconPath,
    this.srcDarkIconPath,
    required this.srcURL,
  });

  @override
  List<Object?> get props => [srcIconPath, srcDarkIconPath, srcURL];
}
