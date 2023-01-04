import 'package:flutter/material.dart';

class IntroductionText extends StatelessWidget {
  const IntroductionText({
    Key? key,
    this.fourLine = false,
  }) : super(key: key);

  final bool fourLine;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final displayLarge = theme.textTheme.displayLarge;
    final colorScheme = theme.colorScheme;

    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Text.rich(
        TextSpan(
          children: [
            const TextSpan(text: 'Hello,\n'),
            const TextSpan(text: "I'm "),
            TextSpan(
              text: 'AmiR\n',
              style: displayLarge?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'Mobile ',
              style: displayLarge?.copyWith(
                color: colorScheme.secondary,
              ),
            ),
            if (fourLine) const TextSpan(text: '\n'),
            TextSpan(
              text: 'Developer.',
              style: displayLarge?.copyWith(
                color: colorScheme.secondary,
              ),
            )
          ],
        ),
        style: displayLarge,
        maxLines: 4,
      ),
    );
  }
}
