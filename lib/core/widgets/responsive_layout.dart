import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  // ============================================================
  // BREAKPOINT
  // ============================================================

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide < 650;
  }

  static bool isTablet(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;

    return shortestSide >= 650 && shortestSide < 1100;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide >= 1100;
  }

  @override
  Widget build(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;

    // ============================================================
    // MOBILE
    // ============================================================

    if (shortestSide < 650) {
      return mobile;
    }

    // ============================================================
    // TABLET
    // ============================================================

    if (shortestSide < 1100) {
      return tablet ?? desktop;
    }

    // ============================================================
    // DESKTOP
    // ============================================================

    return desktop;
  }
}
