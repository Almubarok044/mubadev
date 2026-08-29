import 'package:flutter/material.dart';

class AppColors {
  // Brand Colors
  static const Color teal = Color(0xFF287C7C);
  static const Color blue = Color(0xFF23445A);
  static const Color navy = Color(0xFF111827);

  // Primary Accent
  static const Color primary = teal;

  // Primary Gradient: Teal (#287C7C) -> Navy (#111827)
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [teal, navy],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static Color background(BuildContext context) => 
      Theme.of(context).brightness == Brightness.dark ? const Color(0xFF0B1120) : const Color(0xFFF4F9FF);
      
  static Color surface(BuildContext context) => 
      Theme.of(context).brightness == Brightness.dark ? const Color(0xFF1E293B) : Colors.white;

  static Color textMain(BuildContext context) => 
      Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black87;

  static Color textSecondary(BuildContext context) => 
      Theme.of(context).brightness == Brightness.dark ? Colors.white70 : Colors.grey;

  static Color divider(BuildContext context) => 
      Theme.of(context).brightness == Brightness.dark ? Colors.white24 : Colors.black12;
}
