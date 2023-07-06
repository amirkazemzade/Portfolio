import 'package:flutter/material.dart';

class IntroductionText extends StatelessWidget {
  const IntroductionText({
    Key? key,
    this.fiveLine = false,
  }) : super(key: key);

  final bool fiveLine;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final displayMedium = theme.textTheme.displayMedium;
    final colorScheme = theme.colorScheme;

    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Text.rich(
        TextSpan(
          children: [
            const TextSpan(text: 'Hello,\n'),
            const TextSpan(text: "I'm "),
            TextSpan(
              text: 'Amir\n',
              style: displayMedium?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'Kazemzade\n',
              style: displayMedium?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'Mobile ',
              style: displayMedium?.copyWith(
                color: colorScheme.secondary,
              ),
            ),
            if (fiveLine) const TextSpan(text: '\n'),
            TextSpan(
              text: 'Developer.',
              style: displayMedium?.copyWith(
                color: colorScheme.secondary,
              ),
            )
          ],
        ),
        style: displayMedium,
        maxLines: 5,
      ),
    );
  }
}
