import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mubadev/core/theme/app_colors.dart';
import 'interactive_cursor.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surface(context),
        border: Border(top: BorderSide(color: AppColors.primary, width: 2.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 15,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      padding: EdgeInsets.only(
        top: 24,
        left: 28,
        right: 28,
        bottom: isMobile ? 100 : 24,
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
                      'assets/icon/mubarokdeveloper.png',
                      height: 48,
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.high,
                    ),
                    const SizedBox(height: 20),
                    _buildSocialButtons(context),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icon/mubarokdeveloper.png',
                      height: 52,
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.high,
                    ),
                    _buildSocialButtons(context),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildSocialButtons(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _SocialButton(
          icon: FontAwesomeIcons.github,
          url: 'https://github.com/Almubarok044',
          hoverColor: const Color(0xFF333333),
        ),
        const SizedBox(width: 10),
        _SocialButton(
          icon: FontAwesomeIcons.instagram,
          url: 'https://www.instagram.com/_kai.butsu',
          hoverColor: const Color(0xFFE1306C),
        ),
        const SizedBox(width: 10),
        _SocialButton(
          icon: FontAwesomeIcons.linkedinIn,
          url: 'https://www.linkedin.com/in/mohamad-almubarok-107259284',
          hoverColor: const Color(0xFF0077B5),
        ),
      ],
    );
  }
}

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
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
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
