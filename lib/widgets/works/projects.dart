import 'package:flutter/material.dart';
import 'package:portfolio/widgets/works/project_card.dart';
import 'package:portfolio/widgets/works/project_model.dart';

const _projects = [
  ProjectModel(
    title: 'Portfolio',
    date: 'Jan 2023',
    description:
        'A responsive portfolio website created by flutter and uses material 3 design',
    language: 'Dart',
    framework: 'Flutter',
    platforms: ['Web', 'Mobile', 'Desktop'],
    srcIconPath: 'images/48px/github-icon-black.png',
    srcDarkIconPath: 'images/48px/github-icon-white.png',
    srcURL: 'https://github.com/amirkzm0098/Portfolio',
  ),
  ProjectModel(
    title: 'SMS Ad Blocker',
    date: 'Sep 2022 - Oct 2022',
    description: 'An android app that blocks Irancell\'s spamming ad messages. '
        'It adds predicted ad phone numbers to phone\'s blacklist',
    language: 'Kotlin',
    framework: 'Jetpack Compose',
    platforms: ['Android'],
    srcIconPath: 'images/48px/github-icon-black.png',
    srcDarkIconPath: 'images/48px/github-icon-white.png',
    srcURL: 'https://github.com/amirkzm0098/SMS_Ad_Blocker',
  ),
  ProjectModel(
    title: 'AI Shopping Chat Bot',
    date: 'June 2022',
    description: 'A telegram bot which performs as a shopping helper chat bot. '
        'It uses AI to answer the user with the most suitable response',
    language: 'Python',
    framework: 'Pure',
    platforms: ['Telegram Bot'],
    srcIconPath: 'images/48px/github-icon-black.png',
    srcDarkIconPath: 'images/48px/github-icon-white.png',
    srcURL: 'https://github.com/amirkzm0098/ai_chatbot',
  ),
  ProjectModel(
    title: 'Messenger App - Client',
    date: 'Apr 2022 - May 2022',
    description: 'A desktop messenger app based on socket programming. '
        'It has private chats and group chats. '
        'It uses Kotlin and Jetpack Compose for UI and Java as core of socket connection',
    language: 'Kotlin - Java',
    framework: 'Jetpack Compose',
    platforms: ['Desktop'],
    srcIconPath: 'images/48px/github-icon-black.png',
    srcDarkIconPath: 'images/48px/github-icon-white.png',
    srcURL: 'https://github.com/amirkzm0098/messenger_client',
  ),
  ProjectModel(
    title: 'Messenger App - Server',
    date: 'Apr 2022 - May 2022',
    description: 'Server app of a messenger app based on socket programming. '
        'It has private chats and group chats. '
        'It uses Java as core of socket connection and client management',
    language: 'Java',
    framework: 'Pure',
    platforms: ['Server', 'JVM'],
    srcIconPath: 'images/48px/github-icon-black.png',
    srcDarkIconPath: 'images/48px/github-icon-white.png',
    srcURL: 'https://github.com/amirkzm0098/messenger_server',
  ),
  ProjectModel(
    title: 'My Classes',
    date: 'Jul 2022 - Nov 2022',
    description:
        'An android app for managing school/university classes and their sessions. '
        'It has a daily based time schedule of sessions',
    language: 'Kotlin',
    framework: 'XML',
    platforms: ['Android'],
    srcIconPath: 'images/48px/github-icon-black.png',
    srcDarkIconPath: 'images/48px/github-icon-white.png',
    srcURL: 'https://github.com/amirkzm0098/MyClasses',
  ),
];

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: _projectCards(),
    );
  }

  List<ProjectCard> _projectCards() {
    return _projects.map((project) {
      return ProjectCard(project: project);
    }).toList();
  }
}
