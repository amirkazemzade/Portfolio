import 'dart:math';

import 'package:flutter/material.dart';

class RandomBorderBox extends StatelessWidget {
  const RandomBorderBox({
    Key? key,
    required this.color,
    required this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.elliptical(_getX(), _getY()),
          topRight: Radius.elliptical(_getX(), _getY()),
          bottomRight: Radius.elliptical(_getX(), _getY()),
          bottomLeft: Radius.elliptical(_getX(), _getY()),
        ),
        color: color,
      ),
      child: child,
    );
  }

  double _getY() => Random().nextDouble() * 450 + 200;

  double _getX() => Random().nextDouble() * 450 + 150;
}
