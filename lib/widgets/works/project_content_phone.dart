import 'package:flutter/material.dart';
import 'package:portfolio/styles/dimensions.dart';
import 'package:portfolio/widgets/works/project_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectContentPhone extends StatelessWidget {
  const ProjectContentPhone({Key? key, required this.project})
      : super(key: key);

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textTheme = theme.textTheme;
    return Padding(
      padding: padding8,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    style: textTheme.titleMedium,
                  ),
                  sizedBoxH4,
                  Text(
                    project.date,
                    style: textTheme.titleSmall,
                  ),
                  sizedBoxH4,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Wrap(
                          spacing: 4,
                          runSpacing: 4,
                          children: [
                            Chip(
                              backgroundColor: theme.colorScheme.secondary,
                              label: Text(
                                project.language,
                                style: textTheme.titleSmall?.copyWith(
                                  color: theme.colorScheme.onSecondary,
                                ),
                              ),
                              visualDensity: VisualDensity.compact,
                            ),
                            Chip(
                              backgroundColor: theme.colorScheme.secondary,
                              label: Text(
                                project.framework,
                                style: textTheme.titleSmall?.copyWith(
                                  color: theme.colorScheme.onSecondary,
                                ),
                              ),
                              visualDensity: VisualDensity.compact,
                            ),
                            for (var platform in project.platforms)
                              Chip(
                                label: Text(
                                  platform,
                                  style: textTheme.titleSmall,
                                ),
                                visualDensity: VisualDensity.compact,
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                  sizedBoxH8,
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        project.description,
                        style: textTheme.titleSmall,
                      )),
                    ],
                  ),
                ],
              ),
            ),
            sizedBoxW16,
            InkWell(
              onTap: () => _openProjectSrc(),
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: padding8,
                child: Image.asset(
                  _iconPath(isDark),
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openProjectSrc() async =>
      await launchUrl(Uri.parse(project.srcURL));

  String _iconPath(bool isDark) {
    if (project.srcDarkIconPath != null && isDark) {
      return project.srcDarkIconPath!;
    }
    return project.srcIconPath;
  }
}
