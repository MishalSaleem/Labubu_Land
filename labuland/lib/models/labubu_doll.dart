import 'package:flutter/material.dart';

// A theme class to hold all unique UI properties for a doll.
class DollTheme {
  final String name;
  final Color primary;
  final Color secondary;
  final Color accent;
  final List<Color> gradient;
  final TextStyle titleStyle;
  final TextStyle bodyStyle;

  const DollTheme({
    required this.name,
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.gradient,
    required this.titleStyle,
    required this.bodyStyle,
  });
}

class LabubuDoll {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final String description;
  final DollTheme theme; // Each doll now has a unique theme object

  const LabubuDoll({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
    required this.theme,
  });
}