import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mubadev/core/widgets/interactive_cursor.dart';
import 'package:mubadev/core/theme/app_colors.dart';
import 'package:mubadev/core/theme/theme_manager.dart';

class CustomNavbar extends StatelessWidget {
  final String activeMenu;

  const CustomNavbar({super.key, required this.activeMenu});

  void _onMenuTapped(BuildContext context, String title) {
    if (title == activeMenu) return; // Sudah di halaman ini

    String routeName = '/';
    if (title == 'Beranda') {
      routeName = '/';
    } else if (title == 'Tentang') {
      routeName = '/about';
    } else if (title == 'Keahlian') {
      routeName = '/skills';
    } else if (title == 'Pengalaman') {
      routeName = '/experience';
    } else if (title == 'Proyek') {
      routeName = '/work';
    } else if (title == 'Resume') {
      routeName = '/';
    }

    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surface(context),
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CursorHideRegion(
              child: InkWell(
                onTap: () => _onMenuTapped(context, 'Beranda'),
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? 'assets/icon/mbvlight.png'
                      : 'assets/icon/mbv.png',
                  height: 44,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: 16),
            // List Menu
            _buildMenuItem(
              context,
              'Beranda',
              Icons.home_rounded,
              'navbar_home',
            ),
            _buildMenuItem(
              context,
              'Tentang',
              Icons.person_outline_rounded,
              'navbar_about',
            ),
            _buildMenuItem(
              context,
              'Keahlian',
              Icons.bolt_rounded,
              'navbar_skills',
            ),
            _buildMenuItem(
              context,
              'Proyek',
              Icons.folder_open_rounded,
              'navbar_projects',
            ),
            _buildMenuItem(
              context,
              'Pengalaman',
              Icons.work_outline_rounded,
              'navbar_experience',
            ),
            _buildMenuItem(
              context,
              'Resume',
              Icons.insert_drive_file_outlined,
              'navbar_contact',
              isBoxed: true,
            ),
            const SizedBox(width: 12),
            // Actions (Dark mode & Language)
            CursorHideRegion(
              child: IconButton(
                onPressed: () {
                  ThemeManager.toggleTheme();
                },
                icon: Icon(
                  ThemeManager.themeNotifier.value == ThemeMode.dark
                      ? Icons.light_mode
                      : Icons.dark_mode,
                  color: AppColors.textSecondary(context),
                ),
              ),
            ),
            const SizedBox(width: 12),
            CursorHideRegion(
              child: InkWell(
                onTap: () {
                  if (context.locale.languageCode == 'en') {
                    context.setLocale(const Locale('id'));
                  } else {
                    context.setLocale(const Locale('en'));
                  }
                },
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.language,
                        color: AppColors.textSecondary(context),
                        size: 20,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        tr('navbar_lang'),
                        style: TextStyle(
                          color: AppColors.textSecondary(context),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    String title,
    IconData icon,
    String translationKey, {
    bool isBoxed = false,
  }) {
    bool isActive = activeMenu == title;

    return CursorHideRegion(
      child: StatefulBuilder(
        builder: (context, setState) {
          bool isHovered = false;

          return MouseRegion(
            onEnter: (_) => setState(() => isHovered = true),
            onExit: (_) => setState(() => isHovered = false),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: InkWell(
                onTap: () => _onMenuTapped(context, title),
                borderRadius: BorderRadius.circular(isBoxed ? 12 : 24),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.symmetric(
                    horizontal: isBoxed ? 18 : 16,
                    vertical: isBoxed ? 10 : 10,
                  ),
                  decoration: BoxDecoration(
                    color: isActive || isHovered
                        ? AppColors.primary
                        : (isBoxed
                              ? AppColors.surface(context)
                              : Colors.transparent),
                    borderRadius: BorderRadius.circular(isBoxed ? 12 : 24),
                    border: isBoxed
                        ? Border.all(
                            color: isActive || isHovered
                                ? AppColors.primary
                                : AppColors.divider(context),
                            width: 1.2,
                          )
                        : null,
                  ),
                  child: Row(
                    children: [
                      if (!isBoxed)
                        Icon(
                          icon,
                          size: 18,
                          color: isActive || isHovered
                              ? Colors.white
                              : Colors.grey[600],
                        ),
                      if (!isBoxed) const SizedBox(width: 8),
                      Text(
                        isBoxed ? title : tr(translationKey),
                        style: TextStyle(
                          color: isActive || isHovered
                              ? Colors.white
                              : AppColors.textMain(context),
                          fontWeight: isActive || isHovered
                              ? FontWeight.bold
                              : FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomBottomNavbar extends StatelessWidget {
  final String activeMenu;

  const CustomBottomNavbar({super.key, required this.activeMenu});

  void _onMenuTapped(BuildContext context, String title) {
    if (title == activeMenu) return;

    String routeName = '/';
    if (title == 'Beranda') {
      routeName = '/';
    } else if (title == 'Tentang') {
      routeName = '/about';
    } else if (title == 'Keahlian') {
      routeName = '/skills';
    } else if (title == 'Pengalaman') {
      routeName = '/experience';
    } else if (title == 'Proyek') {
      routeName = '/work';
    } else if (title == 'Resume') {
      routeName = '/';
    }

    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: 360,
      height: 58,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surface(
          context,
        ).withValues(alpha: isDark ? 0.92 : 0.95),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: isDark ? Colors.white12 : Colors.black.withValues(alpha: 0.08),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.35 : 0.12),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildBottomItem(
            context,
            'Beranda',
            Icons.home_rounded,
            'navbar_home',
          ),
          _buildBottomItem(
            context,
            'Tentang',
            Icons.person_outline_rounded,
            'navbar_about',
          ),
          _buildBottomItem(
            context,
            'Keahlian',
            Icons.bolt_rounded,
            'navbar_skills',
          ),
          _buildBottomItem(
            context,
            'Proyek',
            Icons.folder_open_rounded,
            'navbar_projects',
          ),
          _buildBottomItem(
            context,
            'Pengalaman',
            Icons.work_outline_rounded,
            'navbar_experience',
          ),
          _buildBottomItem(
            context,
            'Resume',
            Icons.insert_drive_file_outlined,
            'navbar_contact',
          ),
          Container(
            height: 18,
            width: 1,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            color: AppColors.divider(context),
          ),
          CursorHideRegion(
            child: InkWell(
              onTap: () => ThemeManager.toggleTheme(),
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Icon(
                  ThemeManager.themeNotifier.value == ThemeMode.dark
                      ? Icons.light_mode_rounded
                      : Icons.dark_mode_rounded,
                  color: AppColors.textSecondary(context),
                  size: 19,
                ),
              ),
            ),
          ),
          CursorHideRegion(
            child: InkWell(
              onTap: () {
                if (context.locale.languageCode == 'en') {
                  context.setLocale(const Locale('id'));
                } else {
                  context.setLocale(const Locale('en'));
                }
              },
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6.0,
                  vertical: 6.0,
                ),
                child: Text(
                  context.locale.languageCode.toUpperCase(),
                  style: TextStyle(
                    color: AppColors.textSecondary(context),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomItem(
    BuildContext context,
    String title,
    IconData icon,
    String translationKey,
  ) {
    bool isActive = activeMenu == title;

    return CursorHideRegion(
      child: Tooltip(
        message: tr(translationKey),
        child: InkWell(
          onTap: () => _onMenuTapped(context, title),
          borderRadius: BorderRadius.circular(20),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: isActive ? AppColors.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(
              icon,
              size: 19,
              color: isActive ? Colors.white : AppColors.textSecondary(context),
            ),
          ),
        ),
      ),
    );
  }
}
