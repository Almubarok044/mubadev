import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../core/widgets/page_layout.dart';
import '../../../core/theme/app_colors.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      activeMenu: 'Pengalaman',
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              SizedBox(height: 40),
              Text(
                tr('exp_title'),
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textMain(context),
                ),
              ),
              SizedBox(height: 24),
              Text(
                tr('exp_desc'),
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.textSecondary(context),
                ),
              ),
              SizedBox(height: 300),
            ],
          ),
        ),
      ),
    );
  }
}
