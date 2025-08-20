import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CartButtonEffect extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;

  const CartButtonEffect({
    super.key,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add_shopping_cart, color: Colors.white)
          .animate(onPlay: (controller) => controller.repeat(reverse: true))
          .shakeX(duration: 1000.ms, hz: 1),
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: color,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(12),
      ),
    );
  }
}
