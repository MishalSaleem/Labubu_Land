import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/labubu_dolls.dart';
import 'doll_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;
  final PageController _pageController = PageController(viewportFraction: 0.8);
  bool _isAdoptAnimationActive = false;
  int _animationKey = 0;

  // --- Completely Revamped Magical Color Themes ---
  final Map<int, Map<String, dynamic>> labubuThemes = {
    0: {
      'name': 'Royal Heirloom',
      'primary': const Color(0xFFD4AF37), // Soft Gold
      'secondary': const Color(0xFF5C3D2E), // Espresso
      'gradient': [
        const Color(0xFFC8A37C),
        const Color(0xFF5C3D2E),
        const Color(0xFF4A2A0C),
      ],
      'textColor': Colors.white,
    },
    1: {
      'name': 'Sunset Denim',
      'primary': const Color(0xFF6E85B7), // Vintage Denim Blue
      'secondary': const Color(0xFFFFB6B9), // Sunset Pink
      'gradient': [
        const Color(0xFFF7CAC9),
        const Color(0xFF92A8D1),
        const Color(0xFF6E85B7),
      ],
      'textColor': const Color(0xFF1A2634), // Midnight Blue
    },
    2: {
      'name': 'Crimson Ember',
      'primary': const Color(0xFFE63946), // Vibrant Crimson
      'secondary': const Color(0xFF6A040F), // Dark Berry
      'gradient': [
        const Color(0xFF9D0208),
        const Color(0xFFE63946),
        const Color(0xFF370617),
      ],
      'textColor': Colors.white,
    },
    3: {
      'name': 'Angelic Aura',
      'primary': const Color.fromARGB(255, 70, 123, 138), // Soft Lavender
      'secondary': const Color(0xFF98C1D9), // Gentle Teal
      'titleSecondaryColor': const Color(0xFF9370DB), // Medium Purple for title
      'gradient': [
        const Color.fromARGB(255, 205, 221, 225), // Light Lilac
        const Color.fromARGB(255, 182, 202, 215), // Gentle Teal
        const Color.fromARGB(255, 165, 232, 163), // Soft Lavender
      ],
      'textColor': const Color(0xFF4B0082), // Indigo
    },
    4: {
      'name': 'Cocoa Dream',
      'primary': const Color(0xFF8B4513), // Saddle Brown
      'secondary': const Color(0xFFD2B48C), // Tan
      'gradient': [
        const Color(0xFF5C4033), // Dark Brown
        const Color(0xFFD2B48C), // Tan
        const Color(0xFF8B4513), // Saddle Brown
      ],
      'textColor': const Color(0xFFF5F5DC), // Beige
    },
  };

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.hasClients && _pageController.page != null) {
        if (_pageController.page!.round() != _currentIndex) {
          setState(() {
            _currentIndex = _pageController.page!.round().clamp(0, labubuThemes.length - 1);
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Map<String, dynamic> _getCurrentTheme() {
    return labubuThemes[_currentIndex] ?? labubuThemes[0]!;
  }

  void _showAdoptAnimation() {
    if (mounted) {
      _animationKey++;
      setState(() => _isAdoptAnimationActive = true);
      Future.delayed(const Duration(milliseconds: 2500), () {
        if (mounted) {
          setState(() => _isAdoptAnimationActive = false);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 600;

    final theme = _getCurrentTheme();
    final primaryColor = theme['primary'] as Color? ?? Colors.grey;
    final secondaryColor = theme['secondary'] as Color? ?? Colors.grey;
    final titleSecondaryColor = theme['titleSecondaryColor'] as Color? ?? secondaryColor;
    final textColor = theme['textColor'] as Color? ?? Colors.black;
    final gradientColors = theme['gradient'] as List<Color>? ?? [Colors.grey, Colors.grey];

    final backgroundGradient = LinearGradient(
      colors: gradientColors.map((c) => c.withOpacity(0.4)).toList(),
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Labu',
              style: GoogleFonts.playfairDisplay(
                fontSize: isMobile ? 30 : 36,
                fontWeight: FontWeight.w900,
                color: _currentIndex == 1 || _currentIndex == 3
                    ? const Color(0xFF1A2634)
                    : primaryColor,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              'Land',
              style: GoogleFonts.playfairDisplay(
                fontSize: isMobile ? 30 : 36,
                fontWeight: FontWeight.w900,
                color: _currentIndex == 1 || _currentIndex == 3
                    ? const Color(0xFFD8BFD8)
                    : titleSecondaryColor,
              ),
            ),
          ],
        ).animate().fadeIn(duration: 1000.ms).slideX(begin: -0.2, end: 0, curve: Curves.easeOutBack),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search_rounded,
              color: _currentIndex == 1 || _currentIndex == 3
                  ? const Color(0xFF1A2634)
                  : textColor,
              size: 28,
            ),
            onPressed: () {},
          ).animate().fadeIn(delay: 200.ms).scale(),
          IconButton(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: _currentIndex == 1 || _currentIndex == 3
                  ? const Color(0xFF1A2634)
                  : textColor,
              size: 28,
            ),
            onPressed: () {},
          ).animate().fadeIn(delay: 400.ms).scale(),
        ],
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(gradient: backgroundGradient),
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: BackgroundPatternPainter(
                  primaryColor.withOpacity(0.08),
                ),
              ),
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          'Explore LabuLand',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: isMobile ? 24 : 28,
                            fontWeight: FontWeight.w700,
                            color: _currentIndex == 1 || _currentIndex == 3
                                ? const Color(0xFF1A2634)
                                : textColor,
                          ),
                        ).animate().fadeIn(duration: 800.ms).slideY(
                              begin: 0.5,
                              end: 0,
                              curve: Curves.easeOutCirc,
                            ),
                        const SizedBox(height: 16),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: ['All', 'Featured', 'Collections', 'Trends']
                                .asMap()
                                .entries
                                .map((entry) {
                              final category = entry.value;
                              final isSelected = category == 'All';
                              return Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: isSelected
                                        ? LinearGradient(
                                            colors: [
                                              primaryColor,
                                              titleSecondaryColor,
                                            ],
                                          )
                                        : null,
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                      color: primaryColor.withOpacity(0.5),
                                      width: 1.5,
                                    ),
                                    color: isSelected
                                        ? null
                                        : Colors.white.withOpacity(0.15),
                                  ),
                                  child: Text(
                                    category,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: isSelected
                                          ? (_currentIndex == 1 || _currentIndex == 3
                                              ? const Color(0xFF1A2634)
                                              : textColor)
                                          : (_currentIndex == 1 || _currentIndex == 3
                                              ? const Color(0xFF1A2634)
                                              : textColor),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: labubuDolls.isEmpty
                        ? const Center(child: Text('No dolls available'))
                        : PageView.builder(
                            controller: _pageController,
                            itemCount: labubuDolls.length,
                            itemBuilder: (context, index) {
                              if (index >= labubuThemes.length) {
                                return const SizedBox.shrink(); // Skip invalid indices
                              }
                              final doll = labubuDolls[index];
                              final dollTheme = labubuThemes[index]!;
                              final dollPrimary = dollTheme['primary'] as Color? ?? Colors.grey;
                              final dollSecondary = dollTheme['secondary'] as Color? ?? Colors.grey;
                              final dollText = dollTheme['textColor'] as Color? ?? Colors.black;
                              final dollGradient = dollTheme['gradient'] as List<Color>? ?? [Colors.grey, Colors.grey];
                              final dollName = dollTheme['name'] as String? ?? 'Unknown';

                              return AnimatedBuilder(
                                animation: _pageController,
                                builder: (context, child) {
                                  double pageOffset = 0.0;
                                  if (_pageController.position.haveDimensions) {
                                    pageOffset = _pageController.page! - index;
                                  }
                                  double scale = (1 - (pageOffset.abs() * 0.2)).clamp(0.8, 1.0);
                                  return Transform.scale(scale: scale, child: child);
                                },
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DollDetailScreen(doll: doll),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 24,
                                    ),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: dollGradient,
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(24),
                                      boxShadow: [
                                        BoxShadow(
                                          color: dollPrimary.withOpacity(0.4),
                                          blurRadius: 25,
                                          spreadRadius: 0,
                                          offset: const Offset(0, 15),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 5,
                                            child: Hero(
                                              tag: 'doll_${doll.id}',
                                              child: Image.asset(
                                                doll.imageUrl,
                                                fit: BoxFit.contain,
                                                errorBuilder: (context, error, stackTrace) {
                                                  return const Icon(Icons.error, color: Colors.red);
                                                },
                                              ),
                                            ).animate().fadeIn(duration: 1200.ms).scale(curve: Curves.easeOutBack),
                                          ),
                                          const SizedBox(height: 16),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  dollName,
                                                  maxLines: 1,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w700,
                                                    color: index == 1 || index == 3
                                                        ? const Color(0xFF1A2634)
                                                        : dollText,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                '\$${doll.price.toStringAsFixed(2)}',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: index == 1 || index == 3
                                                      ? const Color(0xFF1A2634)
                                                      : dollText.withOpacity(0.8),
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              GestureDetector(
                                                onTap: _showAdoptAnimation,
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        dollSecondary,
                                                        dollPrimary,
                                                      ],
                                                    ),
                                                    borderRadius: BorderRadius.circular(25),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: dollPrimary.withOpacity(0.5),
                                                        blurRadius: 10,
                                                        offset: const Offset(0, 5),
                                                      ),
                                                    ],
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'Adopt a Labubu ♡',
                                                      style: GoogleFonts.poppins(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w600,
                                                        color: index == 1 || index == 3
                                                            ? const Color(0xFF1A2634)
                                                            : dollText,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ).animate().slideY(
                                                    begin: 0.5,
                                                    end: 0,
                                                    delay: 300.ms,
                                                    duration: 600.ms,
                                                    curve: Curves.easeOutCirc,
                                                  ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
            if (_isAdoptAnimationActive)
              IgnorePointer(
                child: _HeartAnimation(
                  key: ValueKey(_animationKey),
                  theme: theme,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _HeartAnimation extends StatefulWidget {
  final Map<String, dynamic> theme;
  const _HeartAnimation({super.key, required this.theme});

  @override
  State<_HeartAnimation> createState() => _HeartAnimationState();
}

class _HeartAnimationState extends State<_HeartAnimation> {
  final List<Widget> hearts = [];
  final random = Random();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _generateHearts();
      }
    });
  }

  void _generateHearts() {
    final primaryColor = widget.theme['primary'] as Color? ?? Colors.grey;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final centerX = screenWidth / 2;
    for (int i = 0; i < 30; i++) {
      final size = random.nextDouble() * 20 + 15;
      final startY = screenHeight - size;
      final endY = screenHeight * 0.15;
      final spread = 80.0 + random.nextDouble() * 120.0;
      final startX = centerX + random.nextDouble() * spread - spread / 2;
      final duration = Duration(milliseconds: random.nextInt(1200) + 1200);

      hearts.add(
        TweenAnimationBuilder<double>(
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
        ),
      );
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: hearts);
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