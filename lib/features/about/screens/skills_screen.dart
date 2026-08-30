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
    // ============================================================
    // ORIGINAL ROW 1
    // Desktop tetap menggunakan 1 baris ini.
    // ============================================================

    final row1 = [
      _buildSkillBadge(
        context,
        'Dart',
        svgUrl:
            'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/dart/dart-original.svg',
      ),
      _buildSkillBadge(
        context,
        'Java',
        svgUrl:
            'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/java/java-original.svg',
      ),
      _buildSkillBadge(
        context,
        'Kotlin',
        svgUrl:
            'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/kotlin/kotlin-original.svg',
      ),
      _buildSkillBadge(
        context,
        'Flutter',
        svgUrl:
            'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/flutter/flutter-original.svg',
      ),
      _buildSkillBadge(
        context,
        'Android Studio',
        svgUrl:
            'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/androidstudio/androidstudio-original.svg',
      ),
      _buildSkillBadge(
        context,
        'Firebase',
        svgUrl:
            'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/firebase/firebase-original.svg',
      ),
      _buildSkillBadge(
        context,
        'Supabase',
        svgUrl:
            'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/supabase/supabase-original.svg',
      ),
      _buildSkillBadge(
        context,
        'Figma',
        svgUrl:
            'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/figma/figma-original.svg',
      ),
    ];

    // ============================================================
    // ORIGINAL ROW 2
    // Desktop tetap menggunakan 1 baris ini.
    // ============================================================

    final row2 = [
      _buildSkillBadge(
        context,
        'Git',
        svgUrl:
            'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/git/git-original.svg',
      ),
      _buildSkillBadge(
        context,
        'VS Code',
        svgUrl:
            'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/vscode/vscode-original.svg',
      ),
      _buildSkillBadge(
        context,
        'Antigravity',
        fallbackIcon: Icons.rocket_launch_rounded,
      ),
      _buildSkillBadge(
        context,
        'Arduino IDE',
        svgUrl:
            'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/arduino/arduino-original.svg',
      ),
      _buildSkillBadge(
        context,
        'Internet of Things',
        fallbackIcon: Icons.router_rounded,
      ),
      _buildSkillBadge(
        context,
        'Linux',
        svgUrl:
            'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/linux/linux-original.svg',
      ),
      _buildSkillBadge(
        context,
        'Ubuntu',
        svgUrl:
            'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/ubuntu/ubuntu-plain.svg',
      ),
      _buildSkillBadge(
        context,
        'Windows',
        svgUrl:
            'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/windows11/windows11-original.svg',
      ),
    ];

    // ============================================================
    // PORTRAIT MOBILE
    // ============================================================

    final isPortraitMobile = MediaQuery.of(context).size.width < 600;

    // ============================================================
    // SPLIT ROW 1
    //
    // Dart
    // Java
    // Kotlin
    // Flutter
    //
    // Android Studio
    // Firebase
    // Supabase
    // Figma
    // ============================================================

    final row1A = row1.sublist(0, 4);
    final row1B = row1.sublist(4, 8);

    // ============================================================
    // SPLIT ROW 2
    //
    // Git
    // VS Code
    // Antigravity
    // Arduino IDE
    //
    // Internet of Things
    // Linux
    // Ubuntu
    // Windows
    // ============================================================

    final row2A = row2.sublist(0, 4);
    final row2B = row2.sublist(4, 8);

    return PageLayout(
      activeMenu: 'Keahlian',

      child: SizedBox(
        // Mobile dibuat sedikit lebih tinggi karena sekarang
        // mempunyai 4 baris marquee.
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),

            child: Column(
              children: [
                // ==================================================
                // TITLE
                // ==================================================
                const SizedBox(height: 40),

                Text(
                  tr('skills_title'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textMain(context),
                  ),
                ),

                const SizedBox(height: 16),

                // ==================================================
                // DESCRIPTION
                // ==================================================
                Text(
                  tr('skills_desc'),
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary(context),
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 48),

                // ==================================================
                // MARQUEE
                // ==================================================
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),

                  child: _buildFadedMarquee(
                    context,
                    child: isPortraitMobile
                        ? Column(
                            children: [
                              // ==============================================
                              // ROW 1
                              // Kiri → kanan
                              // ==============================================
                              InfiniteMarquee(
                                items: row1A,
                                reverse: true,
                                velocity: 40.0,
                              ),

                              const SizedBox(height: 16),

                              // ==============================================
                              // ROW 2
                              // Kiri → kanan
                              // ==============================================
                              InfiniteMarquee(
                                items: row1B,
                                reverse: true,
                                velocity: 40.0,
                              ),

                              const SizedBox(height: 16),

                              // ==============================================
                              // ROW 3
                              // Kanan → kiri
                              // ==============================================
                              InfiniteMarquee(
                                items: row2A,
                                reverse: false,
                                velocity: 40.0,
                              ),

                              const SizedBox(height: 16),

                              // ==============================================
                              // ROW 4
                              // Kanan → kiri
                              // ==============================================
                              InfiniteMarquee(
                                items: row2B,
                                reverse: false,
                                velocity: 40.0,
                              ),
                            ],
                          )
                        // ==================================================
                        // DESKTOP / TABLET
                        // Tetap 2 baris seperti sebelumnya.
                        // ==================================================
                        : Column(
                            children: [
                              InfiniteMarquee(
                                items: row1,
                                reverse: true,
                                velocity: 40.0,
                              ),

                              const SizedBox(height: 24),

                              InfiniteMarquee(
                                items: row2,
                                reverse: false,
                                velocity: 40.0,
                              ),
                            ],
                          ),
                  ),
                ),

                // ==================================================
                // EXTRA SPACE MOBILE
                // ==================================================
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // FADING EDGE
  // ============================================================

  Widget _buildFadedMarquee(BuildContext context, {required Widget child}) {
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

  // ============================================================
  // SKILL BADGE
  // ============================================================

  Widget _buildSkillBadge(
    BuildContext context,
    String name, {
    String? svgUrl,
    IconData? fallbackIcon,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

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
          // ==================================================
          // SVG ICON
          // ==================================================
          if (svgUrl != null)
            SvgPicture.network(
              svgUrl,
              width: 32,
              height: 32,
              placeholderBuilder: (context) {
                return const SizedBox(
                  width: 32,
                  height: 32,
                  child: CircularProgressIndicator(strokeWidth: 2),
                );
              },
            )
          // ==================================================
          // FALLBACK ICON
          // ==================================================
          else if (fallbackIcon != null)
            Icon(fallbackIcon, size: 32, color: AppColors.primary),

          const SizedBox(width: 16),

          // ==================================================
          // SKILL NAME
          // ==================================================
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textMain(context),
            ),
          ),
        ],
      ),
    );
  }
}
