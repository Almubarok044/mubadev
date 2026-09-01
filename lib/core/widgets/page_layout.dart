import 'dart:ui';

import 'package:flutter/material.dart';

import 'custom_navbar.dart';
import 'custom_footer.dart';
import '../theme/app_colors.dart';

class PageLayout extends StatelessWidget {
  final Widget child;
  final String activeMenu;

  const PageLayout({super.key, required this.child, required this.activeMenu});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final mediaQuery = MediaQuery.of(context);

    final shortestSide = mediaQuery.size.shortestSide;

    // Tetap dianggap mobile walaupun HP diputar landscape.
    final isMobile = shortestSide < 600;

    final gridColor = isDark
        ? Colors.white.withValues(alpha: 0.05)
        : Colors.black.withValues(alpha: 0.05);

    return Scaffold(
      backgroundColor: AppColors.background(context),

      body: Stack(
        children: [
          // ============================================================
          // BACKGROUND GRADIENT
          // ============================================================
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: isDark
                      ? const [
                          Color(0xFF06131F),
                          Color(0xFF0B1A2A),
                          Color(0xFF10273A),
                        ]
                      : const [
                          Color(0xFFEAF7FF),
                          Color(0xFFF8FBFF),
                          Color(0xFFE9F5F1),
                        ],
                ),
              ),
            ),
          ),

          // ============================================================
          // TOP DECORATION
          // ============================================================
          Positioned(
            top: -120,
            left: -80,
            child: AnimatedContainer(
              duration: const Duration(seconds: 18),
              curve: Curves.easeInOutCubic,
              width: 420,
              height: 420,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primary.withValues(alpha: isDark ? 0.28 : 0.18),
                    Colors.transparent,
                  ],
                  radius: 1.2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(
                      alpha: isDark ? 0.25 : 0.16,
                    ),
                    blurRadius: 90,
                    spreadRadius: 18,
                  ),
                ],
              ),
            ),
          ),

          // ============================================================
          // BOTTOM DECORATION
          // ============================================================
          Positioned(
            right: -110,
            bottom: -90,
            child: AnimatedContainer(
              duration: const Duration(seconds: 20),
              curve: Curves.easeInOutCubic,
              width: 420,
              height: 420,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primary.withValues(alpha: isDark ? 0.22 : 0.14),
                    Colors.transparent,
                  ],
                  radius: 1.3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(
                      alpha: isDark ? 0.2 : 0.12,
                    ),
                    blurRadius: 80,
                    spreadRadius: 14,
                  ),
                ],
              ),
            ),
          ),

          // ============================================================
          // BACKDROP BLUR
          // ============================================================
          Positioned.fill(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.2, sigmaY: 1.2),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),

          // ============================================================
          // GRID
          // ============================================================
          Positioned.fill(
            child: CustomPaint(painter: GridPainter(gridColor: gridColor)),
          ),

          // ============================================================
          // SCROLLABLE CONTENT
          //
          // Navbar berada di LUAR SingleChildScrollView,
          // sehingga navbar tidak ikut scroll.
          //
          // Mobile:
          // bottom dibuat lebih besar karena navbar berada di bawah.
          //
          // Desktop:
          // bottom normal.
          // ============================================================
          Positioned.fill(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                // Ruang atas agar content tidak tertutup
                // navbar desktop.
                top: isMobile ? 40 : 100,

                // Ruang bawah ekstra khusus mobile
                // agar footer tidak tertutup bottom navbar.
                bottom: isMobile ? 100 : 0,
              ),
              child: Column(
                children: [
                  SizedBox(width: double.infinity, child: child),

                  const CustomFooter(),
                ],
              ),
            ),
          ),

          // ============================================================
          // MOBILE / PORTRAIT
          //
          // Bottom navbar floating di layer paling atas.
          // ============================================================
          if (isMobile)
            Positioned(
              left: 0,
              right: 0,
              bottom: 16,
              child: SafeArea(
                top: false,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 420),
                      child: CustomBottomNavbar(activeMenu: activeMenu),
                    ),
                  ),
                ),
              ),
            ),

          // ============================================================
          // DESKTOP / TABLET / LANDSCAPE
          //
          // Navbar tetap berada di atas.
          // Logo MBV tetap berasal dari CustomNavbar.
          // ============================================================
          if (!isMobile)
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: SafeArea(
                bottom: false,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1100),
                      child: CustomNavbar(activeMenu: activeMenu),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ============================================================
// GRID PAINTER
// ============================================================

class GridPainter extends CustomPainter {
  final Color gridColor;

  GridPainter({required this.gridColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = gridColor
      ..strokeWidth = 1.0;

    const double spacing = 30.0; // Diperkecil agar grid lebih rapat

    // ============================================================
    // VERTICAL LINES
    // ============================================================

    for (double i = 0; i <= size.width; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    // ============================================================
    // HORIZONTAL LINES
    // ============================================================

    for (double i = 0; i <= size.height; i += spacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant GridPainter oldDelegate) {
    return oldDelegate.gridColor != gridColor;
  }
}
