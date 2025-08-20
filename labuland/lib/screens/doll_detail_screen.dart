import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/labubu_doll.dart';

class DollDetailScreen extends StatefulWidget {
  final LabubuDoll doll;

  const DollDetailScreen({super.key, required this.doll});

  @override
  State<DollDetailScreen> createState() => _DollDetailScreenState();
}

class _DollDetailScreenState extends State<DollDetailScreen> {
  String _selectedSize = 'Small';
  bool _isAdoptAnimationActive = false;

  final Map<int, Map<String, dynamic>> labubuThemes = {
    0: {
      'name': 'Royal Heirloom',
      'primary': const Color.fromARGB(255, 135, 119, 68),
      'secondary': const Color(0xFF5C3D2E),
      'gradient': [
        const Color(0xFFC8A37C),
        const Color(0xFF5C3D2E),
        const Color(0xFF4A2A0C),
      ],
      'textColor': const Color(0xFF2F2F2F),
    },
    1: {
      'name': 'Sunset Denim',
      'primary': const Color(0xFF6E85B7),
      'secondary': const Color(0xFFFFB6B9),
      'gradient': [
        const Color(0xFFF7CAC9),
        const Color(0xFF92A8D1),
        const Color(0xFF6E85B7),
      ],
      'textColor': const Color(0xFF2C3E50),
    },
    2: {
      'name': 'Crimson Ember',
      'primary': const Color(0xFFE63946),
      'secondary': const Color(0xFF6A040F),
      'gradient': [
        const Color(0xFF9D0208),
        const Color(0xFFE63946),
        const Color(0xFF370617),
      ],
      'textColor': const Color(0xFF2F2F2F),
    },
    3: {
      'name': 'Angelic Aura',
      'primary': const Color.fromARGB(255, 70, 123, 138),
      'secondary': const Color(0xFF98C1D9),
      'gradient': [
        const Color.fromARGB(255, 205, 221, 225),
        const Color.fromARGB(255, 182, 202, 215),
        const Color.fromARGB(255, 165, 232, 163),
      ],
      'textColor': const Color(0xFF4B0082),
    },
    4: {
      'name': 'Cocoa Dream',
      'primary': const Color(0xFFC49A6C),
      'secondary': const Color(0xFF7B3F00),
      'gradient': [
        const Color(0xFF5E412F),
        const Color(0xFFC49A6C),
        const Color(0xFF7B3F00),
      ],
      'textColor': const Color(0xFF2F2F2F),
    },
  };

  final Map<int, String> descriptions = {
    0: 'Indulge in the opulent world of the Royal Heirloom Labubu, where golden accents meet rich espresso tones, creating a doll fit for royalty in your dreamy collection.',
    1: 'Drift into dreamy sunsets with the Sunset Denim Labubu, blending vintage denim blues with soft pink hues for a whimsical, carefree vibe that sparks joy.',
    2: 'Ignite your passion with the Crimson Ember Labubu, featuring vibrant crimson shades that evoke warmth, bold adventures, and a touch of fiery magic.',
    3: 'Bask in the ethereal glow of the Angelic Aura Labubu, with soft pastels that whisper of angelic grace, serene beauty, and peaceful daydreams.',
    4: 'Savor the sweet essence of the Cocoa Dream Labubu, wrapped in creamy caramel and warm cocoa for a cozy, delightful companion in your enchanted world.',
  };

  @override
  void initState() {
    super.initState();
  }

  void _showAdoptAnimation() {
    if (mounted) {
      setState(() => _isAdoptAnimationActive = true);
      Future.delayed(const Duration(milliseconds: 1500), () {
        if (mounted) {
          setState(() => _isAdoptAnimationActive = false);
        }
      });
    }
  }

  List<Widget> _buildHeartAnimation(Color primaryColor) {
    final random = Random();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final centerX = screenWidth / 2;

    return List.generate(20, (index) {
      final size = random.nextDouble() * 20 + 15;
      final startY = screenHeight - size - 100;
      final endY = screenHeight * 0.2;
      final spread = 100.0 + random.nextDouble() * 150.0;
      final startX = centerX + random.nextDouble() * spread - spread / 2;
      final duration = Duration(milliseconds: random.nextInt(1000) + 1000);
      final delay = Duration(milliseconds: random.nextInt(300));

      return TweenAnimationBuilder<double>(
        key: UniqueKey(),
        tween: Tween<double>(begin: startY, end: endY),
        duration: duration,
        curve: Curves.easeOut,
        child: Icon(
          Icons.favorite,
          size: size,
          color: primaryColor.withOpacity(0.85),
          shadows: [
            Shadow(color: primaryColor.withOpacity(0.5), blurRadius: 8),
          ],
        ),
        builder: (context, value, child) {
          final fade = ((endY - value) / (endY - startY)).clamp(0.0, 1.0);
          return Positioned(
            top: value,
            left: startX,
            child: Opacity(opacity: fade, child: child!),
          );
        },
      ).animate(delay: delay);
    });
  }

  @override
  Widget build(BuildContext context) {
    final int dollId = int.tryParse(widget.doll.id) ?? 0;
    final theme = labubuThemes[dollId - 1] ?? labubuThemes[0]!;
    final primaryColor = theme['primary'] as Color;
    final secondaryColor = theme['secondary'] as Color;
    final textColor = theme['textColor'] as Color;
    final gradientColors = theme['gradient'] as List<Color>;
    final dollName = theme['name'] as String;
    final description =
        descriptions[dollId - 1] ?? 'A unique Labubu full of charm and wonder.';
    final isMobile = MediaQuery.of(context).size.width < 600;

    final backgroundGradient = LinearGradient(
      colors: gradientColors.map((c) => c.withOpacity(0.4)).toList(),
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: textColor,
              size: isMobile ? 24 : 28,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            dollName,
            style: GoogleFonts.playfairDisplay(
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.share,
                color: textColor,
                size: isMobile ? 24 : 28,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: BackgroundPatternPainter(
                  primaryColor.withOpacity(0.08),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(gradient: backgroundGradient),
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 16 : 32,
                    vertical: isMobile ? 16 : 32,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: SizedBox(
                          width: isMobile ? double.infinity : 400,
                          child:
                              Hero(
                                    tag: 'doll_${widget.doll.id}',
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        isMobile ? 20 : 28,
                                      ),
                                      child: Image.asset(
                                        widget.doll.imageUrl,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  )
                                  .animate()
                                  .fadeIn(duration: 600.ms)
                                  .scale(
                                    duration: 700.ms,
                                    curve: Curves.easeOutCubic,
                                  )
                                  .then()
                                  .rotate(
                                    duration: 1200.ms,
                                    curve: Curves.easeInOut,
                                  ),
                        ),
                      ),
                      SizedBox(height: isMobile ? 24 : 32),

                      Text(
                            dollName,
                            style: GoogleFonts.playfairDisplay(
                              fontSize: isMobile ? 28 : 36,
                              fontWeight: FontWeight.w800,
                              color: textColor,
                            ),
                          )
                          .animate()
                          .fadeIn(delay: 100.ms, duration: 500.ms)
                          .slideX(begin: -0.1, end: 0),
                      SizedBox(height: isMobile ? 8 : 12),
                      Text(
                        '\$${widget.doll.price.toStringAsFixed(2)}',
                        style: GoogleFonts.poppins(
                          fontSize: isMobile ? 22 : 30,
                          fontWeight: FontWeight.w700,
                          color: dollId == 0
                              ? const Color(0xFF2F2F2F)
                              : primaryColor,
                        ),
                      ).animate().fadeIn(delay: 200.ms, duration: 500.ms),
                      SizedBox(height: isMobile ? 12 : 16),
                      Text(
                            description,
                            style: GoogleFonts.poppins(
                              fontSize: isMobile ? 16 : 20,
                              fontWeight: FontWeight.w500,
                              color: textColor.withOpacity(0.85),
                              height: 1.5,
                            ),
                          )
                          .animate()
                          .fadeIn(delay: 300.ms, duration: 500.ms)
                          .slideY(begin: 0.2, end: 0),
                      SizedBox(height: isMobile ? 24 : 32),
                      Text(
                        'Size',
                        style: GoogleFonts.poppins(
                          fontSize: isMobile ? 18 : 22,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        ),
                      ).animate().fadeIn(delay: 400.ms, duration: 500.ms),
                      SizedBox(height: isMobile ? 8 : 12),
                      Wrap(
                        spacing: isMobile ? 8 : 12,
                        runSpacing: isMobile ? 8 : 12,
                        children: ['Small', 'Medium', 'Large'].map((size) {
                          final isSelected = size == _selectedSize;
                          return GestureDetector(
                            onTap: () => setState(() => _selectedSize = size),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              padding: EdgeInsets.symmetric(
                                horizontal: isMobile ? 16 : 24,
                                vertical: isMobile ? 8 : 12,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? primaryColor
                                    : secondaryColor.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(
                                  isMobile ? 20 : 24,
                                ),
                                border: Border.all(
                                  color: primaryColor.withOpacity(0.4),
                                  width: 1.5,
                                ),
                                boxShadow: [
                                  if (isSelected)
                                    BoxShadow(
                                      color: primaryColor.withOpacity(0.3),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                ],
                              ),
                              child: Text(
                                size,
                                style: GoogleFonts.poppins(
                                  fontSize: isMobile
                                      ? 16
                                      : 20, // Increased for readability
                                  fontWeight:
                                      FontWeight.w600, // Adjusted for clarity
                                  color: isSelected
                                      ? secondaryColor
                                      : textColor,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ).animate().fadeIn(delay: 500.ms, duration: 500.ms),
                      SizedBox(height: isMobile ? 32 : 40),
                      Row(
                        children: [
                          ...List.generate(
                            5,
                            (index) => Icon(
                              index < 4
                                  ? Icons.star_rounded
                                  : Icons.star_border_rounded,
                              color: primaryColor.withOpacity(0.8),
                              size: isMobile ? 20 : 26,
                            ),
                          ),
                          SizedBox(width: isMobile ? 8 : 12),
                          Text(
                            '4.2 (128 reviews)',
                            style: GoogleFonts.poppins(
                              fontSize: isMobile
                                  ? 16
                                  : 20, // Increased for readability
                              color: textColor.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ).animate().fadeIn(delay: 600.ms, duration: 500.ms),
                      SizedBox(height: isMobile ? 32 : 40),
                      Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    _showAdoptAnimation();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('$dollName adopted! ♡'),
                                        backgroundColor: primaryColor,
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: isMobile ? 50 : 60,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [secondaryColor, primaryColor],
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        isMobile ? 25 : 30,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: primaryColor.withOpacity(0.4),
                                          blurRadius: 12,
                                          offset: const Offset(0, 6),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Adopt Now ♡',
                                        style: GoogleFonts.poppins(
                                          fontSize: isMobile
                                              ? 18
                                              : 22, // Increased for readability
                                          fontWeight: FontWeight.bold,
                                          color: dollId == 3
                                              ? const Color(0xFF1C2526)
                                              : textColor, // Changed for Angelic Aura
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: isMobile ? 12 : 16),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: isMobile ? 50 : 60,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                        color: primaryColor,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        isMobile ? 25 : 30,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: primaryColor.withOpacity(0.2),
                                          blurRadius: 8,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Buy Now',
                                        style: GoogleFonts.poppins(
                                          fontSize: isMobile
                                              ? 18
                                              : 22, // Increased for readability
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                          .animate()
                          .fadeIn(delay: 700.ms, duration: 500.ms)
                          .slideY(begin: 0.3, end: 0),
                    ],
                  ),
                ),
              ),
            ),
            if (_isAdoptAnimationActive)
              IgnorePointer(
                child: Stack(children: _buildHeartAnimation(primaryColor)),
              ),
          ],
        ),
      ),
    );
  }
}

class BackgroundPatternPainter extends CustomPainter {
  final Color color;
  const BackgroundPatternPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    for (double i = 0; i < size.width; i += 40) {
      for (double j = 0; j < size.height; j += 40) {
        canvas.drawCircle(Offset(i, j), 1.5, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
