import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../core/widgets/page_layout.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/interactive_cursor.dart';
import '../models/project_model.dart';
import '../widgets/project_image.dart';

class ProjectDetailScreen extends StatelessWidget {
  final ProjectModel? project;

  const ProjectDetailScreen({super.key, this.project});

  @override
  Widget build(BuildContext context) {
    // If passed via route arguments or constructor
    final routeProject = ModalRoute.of(context)?.settings.arguments as ProjectModel?;
    final currentProject = project ?? routeProject ?? ProjectModel.projects[0];
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return PageLayout(
      activeMenu: 'Proyek',
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 850),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                CursorHideRegion(
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.arrow_back_rounded, color: AppColors.primary, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            tr('detail_back'),
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Featured Project Image Preview / Upload widget
                ProjectImage(
                  imageAsset: currentProject.imageAsset,
                  title: currentProject.title,
                  category: currentProject.category,
                  height: 380,
                  borderRadius: BorderRadius.circular(24),
                ),

                const SizedBox(height: 32),

                // Category & Title
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    currentProject.category,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  currentProject.title,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textMain(context),
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  currentProject.subtitle,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),

                const SizedBox(height: 32),

                // Project Overview / Description
                Text(
                  tr('detail_bg'),
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textMain(context),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  currentProject.fullDescription,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary(context),
                    height: 1.7,
                  ),
                ),

                if (currentProject.features.isNotEmpty) ...[
                  const SizedBox(height: 28),
                  Text(
                    'Fitur Utama',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textMain(context),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...currentProject.features.map((feature) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 6, right: 12),
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              feature,
                              style: TextStyle(
                                fontSize: 15,
                                color: AppColors.textSecondary(context),
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],

                const SizedBox(height: 32),

                // Technologies Used
                Text(
                  tr('detail_tech'),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textMain(context),
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: currentProject.technologies.map((tech) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColors.surface(context),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: isDark ? Colors.white12 : Colors.black.withValues(alpha: 0.08),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        tech,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColors.textMain(context),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
