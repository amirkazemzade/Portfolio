import 'package:flutter/material.dart';
import 'package:portfolio/styles/dimensions.dart';
import 'package:portfolio/styles/strings.dart';
import 'package:portfolio/widgets/about_me/circle_image.dart';
import 'package:portfolio/widgets/about_me/random_border_box_stack.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: RandomBorderBoxStack(
        colors: [
          colorScheme.primaryContainer,
          colorScheme.secondaryContainer,
          colorScheme.tertiaryContainer,
        ],
        stackCount: 3,
        child: const Padding(
          padding: padding8,
          child: CircleImage(url: profileImageUrl),
        ),
      ),
    );
  }
}
