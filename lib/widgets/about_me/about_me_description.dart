import 'package:flutter/material.dart';
import 'package:portfolio/styles/strings.dart';
import 'package:sizer/sizer.dart';

class AboutMeDescription extends StatelessWidget {
  const AboutMeDescription({
    Key? key,
    this.textSize,
  }) : super(key: key);

  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final textStyle = Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(fontSize: textSize ?? 6.sp);
      return Text(
        aboutMeDescription,
        style: textStyle,
      );
    });
  }
}
