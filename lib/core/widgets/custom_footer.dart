import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mubadev/core/theme/app_colors.dart';
import 'interactive_cursor.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final isMobile = MediaQuery.of(context).size.shortestSide < 600;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 19, sigmaY: 19),
        child: Container(
          width: double.infinity,

          decoration: BoxDecoration(
            // Transparan agar background di belakang tetap terlihat
            // sekaligus bisa menerima efek blur.
            color: isDark
                ? Colors.black.withValues(alpha: 0.18)
                : Colors.white.withValues(alpha: 0.18),

            border: Border(
              top: BorderSide(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.12)
                    : Colors.black.withValues(alpha: 0.08),
                width: 1.2,
              ),
            ),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.18 : 0.08),
                blurRadius: 14,
                offset: const Offset(0, -6),
              ),
            ],
          ),

          padding: EdgeInsets.only(
            top: 12,
            left: 28,
            right: 28,
            bottom: isMobile ? 12 : 8,
          ),

          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),

              child: isMobile
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          isDark
                              ? 'assets/icon/mubarokdeveloperlight2.png'
                              : 'assets/icon/mubarokdeveloper.png',
                          height: 48,
                          fit: BoxFit.contain,
                          filterQuality: FilterQuality.high,
                        ),

                        const SizedBox(height: 16),

                        _buildSocialButtons(context),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          isDark
                              ? 'assets/icon/mubarokdeveloperlight2.png'
                              : 'assets/icon/mubarokdeveloper.png',
                          height: 52,
                          fit: BoxFit.contain,
                          filterQuality: FilterQuality.high,
                        ),

                        _buildSocialButtons(context),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // SOCIAL BUTTONS
  // ============================================================

  Widget _buildSocialButtons(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _SocialButton(
          icon: FontAwesomeIcons.github,
          url: 'https://github.com/Almubarok044',
          hoverColor: const Color(0xFF181717),
        ),

        const SizedBox(width: 10),

        _SocialButton(
          icon: FontAwesomeIcons.instagram,
          url: 'https://www.instagram.com/_kai.butsu',
          hoverColor: const Color(0xFFE4405F),
        ),

        const SizedBox(width: 10),

        _SocialButton(
          icon: FontAwesomeIcons.linkedinIn,
          url: 'https://www.linkedin.com/in/mohamad-almubarok-107259284',
          hoverColor: const Color(0xFF0A66C2),
        ),

        const SizedBox(width: 10),

        _SocialButton(
          icon: FontAwesomeIcons.youtube,
          url: 'https://www.youtube.com/@skullaogaog',
          hoverColor: const Color(0xFFFF0000),
        ),

        const SizedBox(width: 10),

        _SocialButton(
          icon: FontAwesomeIcons.facebookF,
          url: 'https://www.facebook.com/profile.php?id=61574267874258',
          hoverColor: const Color(0xFF1877F2),
        ),
      ],
    );
  }
}

// ============================================================
// SOCIAL BUTTON
// ============================================================

class _SocialButton extends StatefulWidget {
  final dynamic icon;
  final String url;
  final Color hoverColor;

  const _SocialButton({
    required this.icon,
    required this.url,
    required this.hoverColor,
  });

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _isHovered = false;

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(widget.url);

    if (!await launchUrl(uri)) {
      debugPrint('Could not launch ${widget.url}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CursorHideRegion(
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _isHovered = true;
          });
        },

        onExit: (_) {
          setState(() {
            _isHovered = false;
          });
        },

        child: InkWell(
          onTap: _launchUrl,
          borderRadius: BorderRadius.circular(10),

          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),

            padding: const EdgeInsets.all(9),

            decoration: BoxDecoration(
              color: _isHovered
                  ? widget.hoverColor
                  : AppColors.surface(context),

              borderRadius: BorderRadius.circular(10),

              border: Border.all(
                color: _isHovered
                    ? widget.hoverColor
                    : AppColors.divider(context),
              ),

              boxShadow: [
                if (_isHovered)
                  BoxShadow(
                    color: widget.hoverColor.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
              ],
            ),

            child: FaIcon(
              widget.icon,

              color: _isHovered
                  ? Colors.white
                  : AppColors.textSecondary(context),

              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
