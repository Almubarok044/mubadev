import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';
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
                    childAspectRatio: MediaQuery.of(context).size.width > 600
                        ? 1.15
                        : 0.95,
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
                        imageAsset: widget.project.imageAsset,
                        title: widget.project.title,
                        category: widget.project.category,
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            widget.project.category,
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 20,
                          color: _isHovered
                              ? AppColors.primary
                              : AppColors.textSecondary(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.project.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textMain(context),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.project.shortDescription,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.textSecondary(context),
                        fontSize: 15,
                        height: 1.5,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: widget.project.technologies.take(3).map((tech) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: isDark
                                ? Colors.white.withValues(alpha: 0.05)
                                : Colors.black.withValues(alpha: 0.04),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            tech,
                            style: TextStyle(
                              fontSize: 11,
                              color: AppColors.textSecondary(context),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () async {
                            final uri = Uri.tryParse(widget.project.demoUrl);
                            if (uri == null ||
                                !uri.hasScheme ||
                                (uri.scheme != 'http' &&
                                    uri.scheme != 'https') ||
                                uri.host.isEmpty) {
                              debugPrint(
                                'Invalid demo URL: ${widget.project.demoUrl}',
                              );
                              return;
                            }

                            if (!await launchUrl(
                              uri,
                              mode: LaunchMode.externalApplication,
                            )) {
                              debugPrint(
                                'Could not launch ${widget.project.demoUrl}',
                              );
                            }
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.open_in_new_rounded,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  'Live Demo',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
