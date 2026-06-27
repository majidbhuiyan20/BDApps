import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../views/quiz_page.dart';

class QuizBanner extends StatefulWidget {
  const QuizBanner({super.key});

  @override
  State<QuizBanner> createState() => _QuizBannerState();
}

class _QuizBannerState extends State<QuizBanner> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 190, // Increased height to prevent overflow
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4A00E0).withOpacity(0.3),
            blurRadius: 25,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Stack(
          children: [
            // Animated Gradient Background with more vibrant colors
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: const [
                        Color(0xFF8E2DE2),
                        Color(0xFF4A00E0),
                        Color(0xFF7000FF),
                        Color(0xFF8E2DE2),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [
                        0.0,
                        0.3 + 0.1 * math.sin(_controller.value * 2 * math.pi),
                        0.7 + 0.1 * math.cos(_controller.value * 2 * math.pi),
                        1.0,
                      ],
                    ),
                  ),
                );
              },
            ),

            // Enhanced Custom Painter for Live Particles and Waves
            Positioned.fill(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return CustomPaint(
                    painter: _LiveBannerPainter(_controller.value),
                  );
                },
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.white.withOpacity(0.2)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.auto_awesome, color: Colors.amber, size: 12),
                              const SizedBox(width: 4),
                              const Text(
                                "DAILY CHALLENGE",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Test Your Skills\nWin Rewards!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            height: 1.1,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> QuizPage(category: 'Math',)));
                            },
                            borderRadius: BorderRadius.circular(14),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 12,
                                    offset: const Offset(0, 6),
                                  )
                                ],
                              ),
                              child: const Text(
                                'Start Now',
                                style: TextStyle(
                                  color: Color(0xFF4A00E0),
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // More dynamic animated Icon
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, 8 * math.sin(_controller.value * 2 * math.pi)),
                        child: Transform.rotate(
                          angle: 0.1 * math.sin(_controller.value * 4 * math.pi),
                          child: Container(
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white.withOpacity(0.3), width: 1.5),
                              gradient: RadialGradient(
                                colors: [
                                  Colors.white.withOpacity(0.4),
                                  Colors.white.withOpacity(0.05),
                                ],
                              ),
                            ),
                            child: const Icon(
                              Icons.rocket_launch_rounded,
                              size: 52,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LiveBannerPainter extends CustomPainter {
  final double progress;

  _LiveBannerPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Background Waves
    paint.color = Colors.white.withOpacity(0.08);
    final path1 = Path();
    path1.moveTo(0, size.height * 0.7);
    for (double i = 0; i <= size.width; i++) {
      path1.lineTo(
        i,
        size.height * 0.7 + 10 * math.sin((i / 50) + (progress * 2 * math.pi)),
      );
    }
    path1.lineTo(size.width, size.height);
    path1.lineTo(0, size.height);
    path1.close();
    canvas.drawPath(path1, paint);

    paint.color = Colors.white.withOpacity(0.04);
    final path2 = Path();
    path2.moveTo(0, size.height * 0.8);
    for (double i = 0; i <= size.width; i++) {
      path2.lineTo(
        i,
        size.height * 0.8 + 15 * math.cos((i / 60) + (progress * 2 * math.pi)),
      );
    }
    path2.lineTo(size.width, size.height);
    path2.lineTo(0, size.height);
    path2.close();
    canvas.drawPath(path2, paint);

    // Dynamic Particles
    final random = math.Random(123);
    for (int i = 0; i < 20; i++) {
      final double xStatic = random.nextDouble() * size.width;
      final double yStatic = random.nextDouble() * size.height;
      final double speed = 0.3 + random.nextDouble() * 0.7;
      final double sizeParticle = 1 + random.nextDouble() * 5;
      
      final double y = (yStatic - (progress * 150 * speed)) % size.height;
      final double opacity = 0.1 + 0.15 * math.sin(progress * 2 * math.pi + i);
      
      paint.color = Colors.white.withOpacity(opacity.clamp(0.0, 1.0));
      canvas.drawCircle(Offset(xStatic, y), sizeParticle, paint);
    }

    // Glowing Orbs
    final orb1Paint = Paint()
      ..shader = RadialGradient(
        colors: [Colors.white.withOpacity(0.15), Colors.white.withOpacity(0)],
      ).createShader(Rect.fromCircle(center: Offset(size.width * 0.2, size.height * 0.2), radius: 80));
    
    canvas.drawCircle(
      Offset(
        size.width * 0.2 + 15 * math.sin(progress * 2 * math.pi),
        size.height * 0.2 + 10 * math.cos(progress * 2 * math.pi),
      ),
      60 + 10 * math.sin(progress * 2 * math.pi),
      orb1Paint,
    );
  }

  @override
  bool shouldRepaint(covariant _LiveBannerPainter oldDelegate) => true;
}
