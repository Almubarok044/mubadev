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
        assetPath: 'assets/icon/dart-original.svg',
      ),
      _buildSkillBadge(
        context,
        'Java',
        assetPath: 'assets/icon/java-original.svg',
      ),
      _buildSkillBadge(
        context,
        'Kotlin',
        assetPath: 'assets/icon/kotlin-original.svg',
      ),
      _buildSkillBadge(
        context,
        'Flutter',
        assetPath: 'assets/icon/flutter-original.svg',
      ),
      _buildSkillBadge(
        context,
        'Android Studio',
        assetPath: 'assets/icon/androidstudio-original.svg',
      ),
      _buildSkillBadge(
        context,
        'Firebase',
        assetPath: 'assets/icon/firebase-original.svg',
      ),
      _buildSkillBadge(
        context,
        'Supabase',
        assetPath: 'assets/icon/supabase-original.svg',
      ),
      _buildSkillBadge(
        context,
        'Figma',
        assetPath: 'assets/icon/figma-original.svg',
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
        assetPath: 'assets/icon/git-original.svg',
      ),
      _buildSkillBadge(
        context,
        'VS Code',
        assetPath: 'assets/icon/vscode-original.svg',
      ),
      _buildSkillBadge(
        context,
        'Antigravity',
        assetPath: 'assets/icon/antigravity-original.svg',
      ),
      _buildSkillBadge(
        context,
        'Arduino IDE',
        assetPath: 'assets/icon/arduino-original.svg',
      ),
      _buildSkillBadge(
        context,
        'Internet of Things',
        assetPath: 'assets/icon/iotgemini-original.svg',
      ),
      _buildSkillBadge(
        context,
        'Linux',
        assetPath: 'assets/icon/linux-original.svg',
      ),
      _buildSkillBadge(
        context,
        'Ubuntu',
        assetPath: 'assets/icon/ubuntu-original.svg',
      ),
      _buildSkillBadge(
        context,
        'Windows',
        assetPath: 'assets/icon/windows11-original.svg',
      ),
    ];

    // ============================================================
    // PORTRAIT MOBILE
    // ============================================================

    final isPortraitMobile = MediaQuery.of(context).size.width < 600;

    final row1A = row1.sublist(0, 4);
    final row1B = row1.sublist(4, 8);

    final row2A = row2.sublist(0, 4);
    final row2B = row2.sublist(4, 8);

    return PageLayout(
      activeMenu: 'Keahlian',
      child: SizedBox(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
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
                Text(
                  tr('skills_desc'),
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary(context),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: _buildFadedMarquee(
                    context,
                    child: isPortraitMobile
                        ? Column(
                            children: [
                              InfiniteMarquee(
                                items: row1A,
                                reverse: true,
                                velocity: 40.0,
                              ),
                              const SizedBox(height: 16),
                              InfiniteMarquee(
                                items: row1B,
                                reverse: true,
                                velocity: 40.0,
                              ),
                              const SizedBox(height: 16),
                              InfiniteMarquee(
                                items: row2A,
                                reverse: false,
                                velocity: 40.0,
                              ),
                              const SizedBox(height: 16),
                              InfiniteMarquee(
                                items: row2B,
                                reverse: false,
                                velocity: 40.0,
                              ),
                            ],
                          )
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
    String? assetPath,
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
          // LOCAL SVG ASSET
          // ==================================================
          if (assetPath != null)
            SvgPicture.asset(assetPath, width: 32, height: 32)
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
