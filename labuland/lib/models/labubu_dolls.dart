import 'package:flutter/material.dart';
import '../models/labubu_doll.dart';

// Pre-defined themes for each doll
final Map<String, DollTheme> _themes = {
  'macaron': const DollTheme(
    name: 'Pastel Dream',
    primary: Color(0xFFF4ACB7), // Soft Pink
    secondary: Color(0xFF9D8189), // Dusty Rose
    accent: Color(0xFF4A4E69), // Dark Purple-Gray
    gradient: [Color(0xFFFFF1E6), Color(0xFFD8E2DC)],
    titleStyle: TextStyle(fontFamily: 'PlayfairDisplay', fontWeight: FontWeight.bold),
    bodyStyle: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.normal),
  ),
  'wild': const DollTheme(
    name: 'Forest Wanderer',
    primary: Color(0xFF588157), // Forest Green
    secondary: Color(0xFF3A5A40), // Darker Green
    accent: Color(0xFFDAD7CD), // Light Beige
    gradient: [Color(0xFFA3B18A), Color(0xFF588157)],
    titleStyle: TextStyle(fontFamily: 'RobotoSlab', fontWeight: FontWeight.bold),
    bodyStyle: TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.normal),
  ),
  'energy': const DollTheme(
    name: 'Cosmic Pop',
    primary: Color(0xFFF94144), // Vibrant Red
    secondary: Color(0xFFF3722C), // Bright Orange
    accent: Color(0xFF277DA1), // Deep Blue
    gradient: [Color(0xFFF9C74F), Color(0xFFF94144)],
    titleStyle: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w900, fontStyle: FontStyle.italic),
    bodyStyle: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.normal),
  ),
  'seat': const DollTheme(
    name: 'Cloudy Comfort',
    primary: Color(0xFF6C757D), // Cool Grey
    secondary: Color(0xFF495057), // Darker Grey
    accent: Color(0xFFFFFFFF), // White
    gradient: [Color(0xFFE9ECEF), Color(0xFFADB5BD)],
    titleStyle: TextStyle(fontFamily: 'Lora', fontWeight: FontWeight.w600),
    bodyStyle: TextStyle(fontFamily: 'NunitoSans', fontWeight: FontWeight.normal),
  ),
  'coca': const DollTheme(
    name: 'Classic Fizz',
    primary: Color(0xFFE63946), // Coke Red
    secondary: Color(0xFFF1FAEE), // Off-white
    accent: Color(0xFF1D3557), // Dark Blue
    gradient: [Color(0xFFFFFFFF), Color(0xFFE63946)],
    titleStyle: TextStyle(fontFamily: 'Oswald', fontWeight: FontWeight.bold),
    bodyStyle: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.normal),
  ),
};


List<LabubuDoll> labubuDolls = [
  LabubuDoll(
    id: '1',
    name: 'Exciting Macaron Labubu',
    imageUrl: 'assets/images/labubu_macaron.png', // Assuming PNGs for transparency
    price: 27.99,
    description:
        'A sweet, pastel-colored Labubu inspired by delicious macarons. Perfect for collectors seeking a whimsical touch to their display.',
    theme: _themes['macaron']!,
  ),
  LabubuDoll(
    id: '2',
    name: 'Fall in Wild Labubu',
    imageUrl: 'assets/images/labubu_fall_wild.png',
    price: 43.99,
    description:
        'An adventurous Labubu with earthy tones and a heart for exploration. Ready for forest escapades and mischievous fun under the canopy.',
    theme: _themes['wild']!,
  ),
  LabubuDoll(
    id: '3',
    name: 'Big into Energy Labubu',
    imageUrl: 'assets/images/labubu_energy.png',
    price: 54.99,
    description:
        'An energetic Labubu bursting with vibrant colors and positive vibes. This one is a cosmic explosion of joy for your collection.',
    theme: _themes['energy']!,
  ),
  LabubuDoll(
    id: '4',
    name: 'Have a Seat Labubu',
    imageUrl: 'assets/images/labubu_seat.png',
    price: 39.99,
    description:
        'A cozy Labubu designed for ultimate relaxation and comfort. With soft, cloudy hues and a charming sitting pose, it brings peace to any room.',
    theme: _themes['seat']!,
  ),
  LabubuDoll(
    id: '5',
    name: 'Coca-Cola Labubu',
    imageUrl: 'assets/images/labubu_coca.png',
    price: 49.99,
    description:
        'A special edition Labubu collaboration with Coca-Cola. It features the iconic refreshing red and white themes, bubbling with classic charm.',
    theme: _themes['coca']!,
  ),
];