import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // Navigate to HomeScreen after 3.5 seconds with a smooth transition
    Future.delayed(const Duration(milliseconds: 3500), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomeScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation.drive(
                      CurveTween(curve: Curves.easeInOutQuint),
                    ),
                    child: ScaleTransition(
                      scale: animation.drive(
                        Tween<double>(
                          begin: 1.05,
                          end: 1.0,
                        ).chain(CurveTween(curve: Curves.easeOutCubic)),
                      ),
                      child: child,
                    ),
                  );
                },
            transitionDuration: const Duration(milliseconds: 1000),
          ),
        );
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;
    final scaleFactor = size.width / 375; // Base on common mobile width
    final circleSize = (isMobile ? size.width * 0.6 : 240 * scaleFactor).clamp(
      200.0,
      300.0,
    ); // Responsive circle
    final innerCircleSize = circleSize - 15 * scaleFactor;

    // Royal Heirloom theme for seamless transition to brown Labubu
    final theme = {
      'primary': const Color(0xFFD4AF37), // Soft Gold
      'secondary': const Color(0xFF5C3D2E), // Espresso
      'gradient': [
        const Color(0xFFC8A37C).withOpacity(0.4),
        const Color(0xFF5C3D2E).withOpacity(0.4),
        const Color(0xFF4A2A0C).withOpacity(0.4),
      ],
      'textColor': Colors.white,
    };

    final gradient = RadialGradient(
      colors: theme['gradient'] as List<Color>,
      radius: 1.5,
      center: Alignment.center,
      focal: Alignment.topCenter,
      stops: const [0.0, 0.5, 1.0],
    );

    return Scaffold(
      body: Stack(
        children: [
          // Subtle background pattern consistent with HomeScreen
          Positioned.fill(
            child: CustomPaint(
              painter: BackgroundPatternPainter(
                (theme['primary'] as Color).withOpacity(0.08),
              ),
            ),
          ),
          Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(gradient: gradient),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Circular Labubu image with refined animation
                  Container(
                        width: circleSize,
                        height: circleSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: (theme['primary'] as Color).withOpacity(
                                0.5,
                              ),
                              blurRadius: 20 * scaleFactor,
                              spreadRadius: 5 * scaleFactor,
                            ),
                            BoxShadow(
                              color: (theme['secondary'] as Color).withOpacity(
                                0.3,
                              ),
                              blurRadius: 10 * scaleFactor,
                              spreadRadius: 2 * scaleFactor,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/SPLASH.jpg',
                            fit: BoxFit.cover,
                            width: innerCircleSize,
                            height: innerCircleSize,
                          ),
                        ),
                      )
                      .animate()
                      .fadeIn(duration: 1000.ms)
                      .scale(
                        duration: 2000.ms,
                        begin: const Offset(0.85, 0.85),
                        end: const Offset(1.1, 1.1),
                        curve: Curves.easeInOutSine,
                      )
                      .rotate(
                        duration: 5000.ms,
                        begin: -0.05,
                        end: 0.05,
                        curve: Curves.easeInOut,
                      )
                      .shimmer(
                        duration: 2500.ms,
                        color: (theme['primary'] as Color).withOpacity(0.4),
                      ),
                  SizedBox(height: 32 * scaleFactor),
                  // Elegant app name
                  Text(
                        'LabuLand',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: isMobile
                              ? 40 * scaleFactor
                              : 48 * scaleFactor,
                          fontWeight: FontWeight.w800,
                          color: theme['textColor'] as Color,
                          letterSpacing: 2,
                          shadows: [
                            Shadow(
                              color: (theme['secondary'] as Color).withOpacity(
                                0.3,
                              ),
                              offset: const Offset(0, 2),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                      )
                      .animate()
                      .fadeIn(duration: 1200.ms, delay: 400.ms)
                      .slideY(
                        begin: 0.3,
                        end: 0,
                        duration: 1000.ms,
                        curve: Curves.easeOutQuint,
                      ),
                  SizedBox(height: 16 * scaleFactor),
                  // Subtle tagline
                  Text(
                        'Discover the Charm of Labubu',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: isMobile
                              ? 16 * scaleFactor
                              : 20 * scaleFactor,
                          fontWeight: FontWeight.w500,
                          color: (theme['textColor'] as Color).withOpacity(
                            0.85,
                          ),
                          letterSpacing: 1.2,
                        ),
                      )
                      .animate()
                      .fadeIn(duration: 1000.ms, delay: 600.ms)
                      .slideY(
                        begin: 0.2,
                        end: 0,
                        duration: 800.ms,
                        curve: Curves.easeOutBack,
                      ),
                  SizedBox(height: 32 * scaleFactor),
                  // Minimalist loading indicator
                  Container(
                        width: 50 * scaleFactor,
                        height: 50 * scaleFactor,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              (theme['primary'] as Color),
                              (theme['secondary'] as Color),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: (theme['primary'] as Color).withOpacity(
                                0.3,
                              ),
                              blurRadius: 10 * scaleFactor,
                              spreadRadius: 2 * scaleFactor,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            Icons.favorite,
                            color: (theme['textColor'] as Color).withOpacity(
                              0.9,
                            ),
                            size: 24 * scaleFactor,
                          ),
                        ),
                      )
                      .animate()
                      .fadeIn(duration: 800.ms, delay: 800.ms)
                      .rotate(
                        duration: 2000.ms,
                        begin: 0,
                        end: 1,
                        curve: Curves.easeInOut,
                      )
                      .scale(
                        duration: 1500.ms,
                        begin: const Offset(0.9, 0.9),
                        end: const Offset(1.05, 1.05),
                        curve: Curves.easeInOutSine,
                      ),
                ],
              ),
            ),
          ),
        ],
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
