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
              SizedBox(height: 40),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: ResponsiveLayout(
                  mobile: Column(
                    children: [
                      _buildProfileImage(context),
                      SizedBox(height: 40),
                      _buildTextContent(context),
                    ],
                  ),
                  tablet: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: _buildProfileImage(context),
                      ),
                      SizedBox(width: 40),
                      Expanded(
                        flex: 2,
                        child: _buildTextContent(context),
                      ),
                    ],
                  ),
                  desktop: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: _buildTextContent(context),
                      ),
                      SizedBox(width: 60),
                      Expanded(
                        flex: 1,
                        child: _buildProfileImage(context),
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

  Widget _buildTextContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr('about_title'),
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: AppColors.textMain(context),
          ),
        ),
        SizedBox(height: 24),
        Text(
          tr('about_p1'),
          style: TextStyle(
            fontSize: 18,
            color: AppColors.textSecondary(context),
            height: 1.6,
          ),
        ),
        SizedBox(height: 16),
        Text(
          tr('about_p2'),
          style: TextStyle(
            fontSize: 18,
            color: AppColors.textSecondary(context),
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surface(context),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark 
              ? Colors.white12 
              : Colors.black.withValues(alpha: 0.05),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.person,
          size: 80,
          color: Theme.of(context).brightness == Brightness.dark 
              ? Colors.white24 
              : Colors.black12,
        ),
      ),
    );
  }
}
