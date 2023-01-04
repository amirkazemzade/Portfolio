import 'package:flutter/material.dart';
import 'package:portfolio/widgets/about_me/random_border_box.dart';

class RandomBorderBoxStack extends StatelessWidget {
  const RandomBorderBoxStack({
    Key? key,
    this.stackCount = 1,
    required this.colors,
    required this.child,
  }) : super(key: key);

  final int stackCount;
  final List<Color> colors;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      clipBehavior: Clip.none,
      children: [
        for (int i = 0; i < stackCount; i++)
          RandomBorderBox(
            color: colors[i % colors.length],
            child: SizedBox(
              width: 200 - (16.0 * i),
              height: 200 - (16.0 * i),
              child: i == stackCount - 1 ? child : null,
            ),
          )
      ],
    );
  }
}
