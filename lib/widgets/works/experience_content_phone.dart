import 'package:flutter/material.dart';
import 'package:portfolio/styles/dimensions.dart';
import 'package:portfolio/widgets/works/experience_model.dart';

class ExperienceContentPhone extends StatelessWidget {
  const ExperienceContentPhone({
    Key? key,
    required this.experience,
  }) : super(key: key);

  final ExperienceModel experience;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              experience.logoPath,
              width: 50,
              height: 50,
            ),
          ),
          sizedBoxW16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  experience.companyName,
                  style: textTheme.titleMedium,
                ),
                sizedBoxH4,
                Text(
                  experience.date,
                  style: textTheme.titleSmall,
                ),
                sizedBoxH4,
                Text(
                  experience.jobTitle,
                  style: textTheme.bodyMedium,
                ),
                sizedBoxH4,
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: [
                    for (var skill in experience.topSkills)
                      Chip(
                        label: Text(
                          skill,
                          style: textTheme.bodySmall,
                        ),
                        visualDensity: VisualDensity.compact,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
