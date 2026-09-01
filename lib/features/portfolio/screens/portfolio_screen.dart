import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../core/widgets/page_layout.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/interactive_cursor.dart';
import '../models/project_model.dart';
import '../widgets/project_image.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = ProjectModel.projects;

    return PageLayout(
      activeMenu: 'Proyek',
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                Text(
                  tr('portfolio_title'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textMain(context),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  tr('portfolio_desc'),
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary(context),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width > 900
                        ? 2
                        : 1,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    // --- UBAH BAGIAN INI ---
                    // childAspectRatio = Lebar / Tinggi.
                    // Semakin kecil nilainya (< 1.0), semakin tinggi kartunya.
                    childAspectRatio: MediaQuery.of(context).size.width > 900
                        ? 1.15 // Desktop (2 kolom)
                        : MediaQuery.of(context).size.width > 600
                        ? 1.4 // Tablet (1 kolom)
                        : 0.95, // Mobile (1 kolom)
                    // -----------------------
                  ),
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    return HoverPortfolioCard(project: projects[index]);
                  },
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HoverPortfolioCard extends StatefulWidget {
  final ProjectModel project;

  const HoverPortfolioCard({super.key, required this.project});

  @override
  State<HoverPortfolioCard> createState() => _HoverPortfolioCardState();
}

class _HoverPortfolioCardState extends State<HoverPortfolioCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return CursorHideRegion(
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            '/project_detail',
            arguments: widget.project,
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 260),
            curve: Curves.easeOutCubic,
            transform: Matrix4.translationValues(0, _isHovered ? -4 : 0, 0)
              ..scaleByDouble(_isHovered ? 1.01 : 1.0, 1.01, 1.01, 1.0),
            decoration: BoxDecoration(
              color: AppColors.surface(context),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: _isHovered
                    ? AppColors.primary.withValues(alpha: 0.45)
                    : (isDark
                          ? Colors.white12
                          : Colors.black.withValues(alpha: 0.05)),
                width: _isHovered ? 1.4 : 1.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: _isHovered
                      ? AppColors.primary.withValues(alpha: 0.22)
                      : Colors.black.withValues(alpha: 0.04),
                  blurRadius: _isHovered ? 24 : 12,
                  offset: Offset(0, _isHovered ? 12 : 6),
                ),
              ],
            ),
            padding: const EdgeInsets.all(20),
            child: Stack(
              children: [
                if (_isHovered)
                  Positioned.fill(
                    child: IgnorePointer(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 260),
                        curve: Curves.easeOutCubic,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: RadialGradient(
                            center: Alignment.topCenter,
                            radius: 1.2,
                            colors: [
                              AppColors.primary.withValues(
                                alpha: isDark ? 0.17 : 0.10,
                              ),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ProjectImage(
                        imageAsset: widget
                            .project
                            .thumbnailAsset, // <-- DIUBAH KE thumbnailAsset
                        title: widget.project.title,
                        category: widget.project.category,
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            widget.project.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textMain(context),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Icon(
                          Icons.arrow_outward_rounded,
                          size: 22,
                          color: _isHovered
                              ? AppColors.primary
                              : AppColors.textSecondary(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${widget.project.category.tr()}  |  2025 - ${'country_indonesia'.tr()}',
                      style: TextStyle(
                        color: AppColors.textSecondary(context),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
