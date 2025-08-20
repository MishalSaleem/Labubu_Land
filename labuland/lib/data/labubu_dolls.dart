// lib/models/labubu_dolls.dart
import 'package:labuland/models/labubu_doll.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final List<LabubuDoll> labubuDolls = [
  LabubuDoll(
    id: '1',
    name: 'Cosmic Labubu',
    description: 'The adorable cosmic-themed Labubu doll with starry features.',
    price: 29.99,
    imageUrl: 'assets/images/labubu1.png',
    theme: DollTheme(
      name: 'Cosmic',
      primary: Color(0xFF8A2BE2),
      secondary: Color(0xFF4169E1),
      accent: Color(0xFFFF69B4),
      gradient: [Color(0xFF8A2BE2), Color(0xFF4169E1), Color(0xFFFF69B4)],
      titleStyle: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF8A2BE2),
      ),
      bodyStyle: GoogleFonts.poppins(fontSize: 14, color: Color(0xFF4169E1)),
    ),
  ),
  LabubuDoll(
    id: '2',
    name: 'Rainbow Labubu',
    description: 'The colorful Labubu that brings joy and happiness.',
    price: 34.99,
    imageUrl: 'assets/images/labubu2.png',
    theme: DollTheme(
      name: 'Rainbow',
      primary: Color(0xFFFF6B6B),
      secondary: Color(0xFFFFD700),
      accent: Color(0xFF32CD32),
      gradient: [Color(0xFFFF6B6B), Color(0xFFFFD700), Color(0xFF32CD32)],
      titleStyle: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFFFF6B6B),
      ),
      bodyStyle: GoogleFonts.poppins(fontSize: 14, color: Color(0xFFFFD700)),
    ),
  ),
  LabubuDoll(
    id: '3',
    name: 'Aqua Labubu',
    description: 'The ocean-inspired Labubu with aquatic elements.',
    price: 32.99,
    imageUrl: 'assets/images/labubu3.png',
    theme: DollTheme(
      name: 'Aqua',
      primary: Color(0xFF00008B),
      secondary: Color(0xFF40E0D0),
      accent: Color(0xFF5F9EA0),
      gradient: [Color(0xFF00008B), Color(0xFF40E0D0), Color(0xFF5F9EA0)],
      titleStyle: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF00008B),
      ),
      bodyStyle: GoogleFonts.poppins(fontSize: 14, color: Color(0xFF40E0D0)),
    ),
  ),
  LabubuDoll(
    id: '4',
    name: 'Sunset Labubu',
    description: 'The warm and cozy Labubu with sunset colors.',
    price: 36.99,
    imageUrl: 'assets/images/labubu4.png',
    theme: DollTheme(
      name: 'Sunset',
      primary: Color(0xFFFF8C00),
      secondary: Color(0xFF9370DB),
      accent: Color(0xFFFF69B4),
      gradient: [Color(0xFFFF8C00), Color(0xFF9370DB), Color(0xFFFF69B4)],
      titleStyle: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFFFF8C00),
      ),
      bodyStyle: GoogleFonts.poppins(fontSize: 14, color: Color(0xFF9370DB)),
    ),
  ),
  LabubuDoll(
    id: '5',
    name: 'Forest Labubu',
    description: 'The nature-inspired Labubu with earthy tones.',
    price: 33.99,
    imageUrl: 'assets/images/labubu5.png',
    theme: DollTheme(
      name: 'Forest',
      primary: Color(0xFF228B22),
      secondary: Color(0xFFA0522D),
      accent: Color(0xFF6B8E23),
      gradient: [Color(0xFF228B22), Color(0xFFA0522D), Color(0xFF6B8E23)],
      titleStyle: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF228B22),
      ),
      bodyStyle: GoogleFonts.poppins(fontSize: 14, color: Color(0xFFA0522D)),
    ),
  ),
];
