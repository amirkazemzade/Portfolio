import 'package:flutter/material.dart';
import 'package:portfolio/styles/dimensions.dart';
import 'package:portfolio/widgets/contact_me/contact_method_model.dart';
import 'package:url_launcher/url_launcher.dart';

const _contactMethods = [
  ContactMethodModel(
    srcIconPath: 'images/200px/github-logo-black.png',
    srcDarkIconPath: 'images/200px/github-logo-white.png',
    srcURL: 'https://github.com/amirkzm0098',
  ),
  ContactMethodModel(
    srcIconPath: 'images/200px/linked-in-logo.png',
    srcURL: 'https://linkedin.com/in/amir-kazemzade-28b43b232',
  ),
  ContactMethodModel(
    srcIconPath: 'images/200px/gmail-logo.png',
    srcURL: 'mailto:amirkzm0098@gmail.com',
  ),
];

class ContactMe extends StatelessWidget {
  const ContactMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding16,
        child: Wrap(
            children: _contactMethods
                .map((method) => ContactCard(contactMethod: method))
                .toList()),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  const ContactCard({
    Key? key,
    required this.contactMethod,
  }) : super(key: key);

  final ContactMethodModel contactMethod;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => _openProjectSrc(),
        child: Padding(
          padding: padding8,
          child: Image.asset(
            width: 48,
            height: 48,
            _iconPath(isDark),
          ),
        ),
      ),
    );
  }

  String _iconPath(bool isDark) {
    if (contactMethod.srcDarkIconPath != null && isDark) {
      return contactMethod.srcDarkIconPath!;
    }
    return contactMethod.srcIconPath;
  }

  Future<void> _openProjectSrc() async {
    var url = Uri.parse(contactMethod.srcURL);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
