import 'package:flutter/material.dart';
import 'custom_navbar.dart';
import 'custom_footer.dart';
import 'interactive_cursor.dart';
import '../theme/app_colors.dart';

class PageLayout extends StatelessWidget {
  final Widget child;
  final String activeMenu;

  const PageLayout({super.key, required this.child, required this.activeMenu});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    bool isMobile = MediaQuery.of(context).size.width < 768;
    Color gridColor = isDark
        ? Colors.white.withValues(alpha: 0.05)
        : Colors.black.withValues(alpha: 0.05);

    return Scaffold(
      backgroundColor: AppColors.background(context),
      appBar: isMobile
          ? null
          : PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(child: CustomNavbar(activeMenu: activeMenu)),
                ),
              ),
            ),
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(painter: GridPainter(gridColor: gridColor)),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                if (isMobile)
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 16.0,
                        left: 20.0,
                        right: 20.0,
                        bottom: 8.0,
                      ),
                      child: Row(
                        children: [
                          CursorHideRegion(
                            child: InkWell(
                              onTap: () {
                                if (activeMenu != 'Beranda') {
                                  Navigator.pushReplacementNamed(context, '/');
                                }
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/icon/mbv.png',
                                height: 36,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                SizedBox(width: double.infinity, child: child),
                const CustomFooter(),
              ],
            ),
          ),
          if (isMobile)
            Positioned(
              left: 12,
              right: 12,
              bottom: 16,
              child: SafeArea(
                child: Center(
                  child: CustomBottomNavbar(activeMenu: activeMenu),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  final Color gridColor;

  GridPainter({required this.gridColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = gridColor
      ..strokeWidth = 1.0;

    const double spacing = 40.0;

    // Draw vertical lines
    for (double i = 0; i <= size.width; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    // Draw horizontal lines
    for (double i = 0; i <= size.height; i += spacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant GridPainter oldDelegate) {
    return oldDelegate.gridColor != gridColor;
  }
}
