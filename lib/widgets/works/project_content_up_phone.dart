import 'package:flutter/material.dart';
import 'package:portfolio/styles/dimensions.dart';
import 'package:portfolio/widgets/works/project_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectContentUpPhone extends StatelessWidget {
  const ProjectContentUpPhone({Key? key, required this.project})
      : super(key: key);

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textTheme = theme.textTheme;
    return Padding(
      padding: padding16,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        project.title,
                        style: textTheme.titleLarge,
                      ),
                      Text(
                        project.date,
                        style: textTheme.titleMedium,
                      ),
                    ],
                  ),
                  sizedBoxH8,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Chip(
                        backgroundColor: theme.colorScheme.secondary,
                        label: Text(
                          project.language,
                          style: textTheme.subtitle2?.copyWith(
                            color: theme.colorScheme.onSecondary,
                          ),
                        ),
                        visualDensity: VisualDensity.compact,
                      ),
                      sizedBoxW4,
                      Chip(
                        backgroundColor: theme.colorScheme.secondary,
                        label: Text(
                          project.framework,
                          style: textTheme.subtitle2?.copyWith(
                            color: theme.colorScheme.onSecondary,
                          ),
                        ),
                        visualDensity: VisualDensity.compact,
                      ),
                      sizedBoxW4,
                      Expanded(
                        child: Wrap(
                          alignment: WrapAlignment.end,
                          spacing: 4,
                          runSpacing: 4,
                          children: [
                            for (var platform in project.platforms)
                              Chip(
                                label: Text(
                                  platform,
                                  style: textTheme.subtitle2,
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
                          style: textTheme.subtitle2,
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
                            width: 36,
                            height: 36,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
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
