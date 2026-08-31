import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../core/widgets/page_layout.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/responsive_layout.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      activeMenu: 'Tentang',
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),

              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: ResponsiveLayout(
                  // ==================================================
                  // MOBILE
                  // ==================================================
                  mobile: Column(
                    children: [
                      _buildProfileImage(context),
                      const SizedBox(height: 50),
                      _buildTextContent(context),
                    ],
                  ),

                  // ==================================================
                  // TABLET
                  // ==================================================
                  tablet: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 1, child: _buildProfileImage(context)),

                      const SizedBox(width: 40),

                      Expanded(flex: 2, child: _buildTextContent(context)),
                    ],
                  ),

                  // ==================================================
                  // DESKTOP
                  // ==================================================
                  desktop: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 1, child: _buildProfileImage(context)),

                      const SizedBox(width: 70),

                      Expanded(flex: 2, child: _buildTextContent(context)),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // TEXT CONTENT
  // ============================================================

  Widget _buildTextContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr('about_title'),
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: AppColors.textMain(context),
          ),
        ),

        const SizedBox(height: 24),

        Text(
          tr('about_p1'),
          style: TextStyle(
            fontSize: 16,
            color: AppColors.textSecondary(context),
            height: 1.7,
          ),
        ),

        const SizedBox(height: 16),

        Text(
          tr('about_p2'),
          style: TextStyle(
            fontSize: 16,
            color: AppColors.textSecondary(context),
            height: 1.7,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // PROFILE IMAGE
  // ============================================================

  Widget _buildProfileImage(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Container(
        width: 320,
        height: 360,
        decoration: BoxDecoration(
          color: AppColors.surface(context),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'assets/images/me.png',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: isDark ? Colors.grey.shade800 : Colors.grey.shade300,
                child: const Center(child: Icon(Icons.person, size: 80)),
              );
            },
          ),
        ),
      ),
    );
  }
}
