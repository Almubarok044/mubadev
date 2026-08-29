import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../core/widgets/page_layout.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/infinite_marquee.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List for row 1 (left to right)
    final row1 = [
      _buildSkillBadge(context, 'Dart', svgUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/dart/dart-original.svg'),
      _buildSkillBadge(context, 'Java', svgUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/java/java-original.svg'),
      _buildSkillBadge(context, 'Kotlin', svgUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/kotlin/kotlin-original.svg'),
      _buildSkillBadge(context, 'Flutter', svgUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/flutter/flutter-original.svg'),
      _buildSkillBadge(context, 'Android Studio', svgUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/androidstudio/androidstudio-original.svg'),
      _buildSkillBadge(context, 'Firebase', svgUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/firebase/firebase-original.svg'),
      _buildSkillBadge(context, 'Supabase', svgUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/supabase/supabase-original.svg'),
      _buildSkillBadge(context, 'Figma', svgUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/figma/figma-original.svg'),
      _buildSkillBadge(context, 'Git', svgUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/git/git-original.svg'),
      _buildSkillBadge(context, 'VS Code', svgUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/vscode/vscode-original.svg'),
    ];

    // List for row 2 (right to left)
    final row2 = [
      _buildSkillBadge(context, 'Antigravity', fallbackIcon: Icons.rocket_launch_rounded),
      _buildSkillBadge(context, 'Arduino IDE', svgUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/arduino/arduino-original.svg'),
      _buildSkillBadge(context, 'Internet of Things', fallbackIcon: Icons.router_rounded),
      _buildSkillBadge(context, 'Linux', svgUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/linux/linux-original.svg'),
      _buildSkillBadge(context, 'Ubuntu', svgUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/ubuntu/ubuntu-plain.svg'), // Using plain for Ubuntu
      _buildSkillBadge(context, 'Windows', svgUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/windows11/windows11-original.svg'),
    ];

    return PageLayout(
      activeMenu: 'Keahlian',
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              SizedBox(height: 40),
              Text(
                tr('skills_title'),
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textMain(context),
                ),
              ),
              SizedBox(height: 16),
              Text(
                tr('skills_desc'),
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.textSecondary(context),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 48),
              
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: _buildFadedMarquee(
                  context,
                  Column(
                    children: [
                      InfiniteMarquee(
                        items: row1,
                        reverse: true, // Bergeser dari kiri ke kanan
                        velocity: 40.0,
                      ),
                      SizedBox(height: 24),
                      InfiniteMarquee(
                        items: row2,
                        reverse: false, // Bergeser dari kanan ke kiri
                        velocity: 40.0,
                      ),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFadedMarquee(BuildContext context, Widget child) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [
            Colors.transparent,
            Colors.white,
            Colors.white,
            Colors.transparent,
          ],
          stops: [0.0, 0.1, 0.9, 1.0],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: child,
    );
  }

  Widget _buildSkillBadge(BuildContext context, String name, {String? svgUrl, IconData? fallbackIcon}) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surface(context),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: isDark ? Border.all(color: Colors.white12) : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (svgUrl != null)
            SvgPicture.network(
              svgUrl,
              width: 32,
              height: 32,
              placeholderBuilder: (context) => const SizedBox(
                width: 32,
                height: 32,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            )
          else if (fallbackIcon != null)
            Icon(fallbackIcon, size: 32, color: AppColors.primary),
          const SizedBox(width: 16),
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textMain(context),
            ),
          ),
        ],
      ),
    );
  }
}
