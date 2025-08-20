import 'package:flutter/material.dart';

class PageTransitionEffect extends StatelessWidget {
  final double position;
  final Widget child;

  const PageTransitionEffect({
    super.key,
    required this.position,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // Perspective
        ..rotateY(position * 0.5)
        ..translate(position * 200, 0, 0),
      alignment: FractionalOffset.center,
      child: Opacity(
        opacity: (1 - position.abs()).clamp(0.0, 1.0),
        child: child,
      ),
    );
  }
}
