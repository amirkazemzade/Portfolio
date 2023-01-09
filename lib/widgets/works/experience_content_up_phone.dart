import 'package:flutter/material.dart';
import 'package:portfolio/styles/dimensions.dart';
import 'package:portfolio/widgets/works/experience_model.dart';

class ExperienceContentUpPhone extends StatelessWidget {
  const ExperienceContentUpPhone({
    Key? key,
    required this.experience,
  }) : super(key: key);

  final ExperienceModel experience;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return IntrinsicHeight(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              experience.logoPath,
              width: 100,
              height: 100,
            ),
          ),
          sizedBoxW16,
          Expanded(
            child: Column(
              children: [
                sizedBoxH4,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      experience.companyName,
                      style: textTheme.titleLarge,
                    ),
                    Text(
                      experience.date,
                      style: textTheme.titleMedium,
                    ),
                  ],
                ),
                sizedBoxH4,
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      experience.jobTitle,
                      style: textTheme.titleSmall,
                    ),
                    sizedBoxW4,
                    Expanded(
                      child: Wrap(
                        alignment: WrapAlignment.end,
                        spacing: 4,
                        runSpacing: 4,
                        children: [
                          for (var skill in experience.topSkills)
                            Chip(
                              label: Text(
                                skill,
                                style: textTheme.subtitle2,
                              ),
                              visualDensity: VisualDensity.compact,
                            ),
                        ],
                      ),
                    )
                  ],
                ),
                sizedBoxH4,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
