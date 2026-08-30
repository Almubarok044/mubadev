import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'core/theme/app_colors.dart';
import 'features/home/screens/home_screen.dart';
import 'features/portfolio/screens/portfolio_screen.dart';
import 'features/portfolio/screens/project_detail_screen.dart';
import 'features/portfolio/models/project_model.dart';
import 'features/about/screens/about_screen.dart';
import 'features/about/screens/skills_screen.dart';
import 'features/about/screens/experience_screen.dart';

import 'core/theme/theme_manager.dart';
import 'core/widgets/interactive_cursor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('id')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeManager.themeNotifier,
      builder: (context, currentMode, child) {
        return MaterialApp(
          title: 'Mubarok | Flutter Developer',
          debugShowCheckedModeBanner: false,
          themeMode: currentMode,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          builder: (context, child) {
            return InteractiveCursor(child: child!);
          },
          theme: ThemeData(
            fontFamily: 'Inter',
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primary,
              brightness: Brightness.light,
            ),
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.background(context),
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primary,
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.background(context),
          ),
          initialRoute: '/',
          onGenerateRoute: (settings) {
            Widget page;
            switch (settings.name) {
              case '/':
                page = const HomeScreen();
                break;
              case '/work':
                page = const PortfolioScreen();
                break;
              case '/project_detail':
                page = ProjectDetailScreen(
                  project: settings.arguments as ProjectModel?,
                );
                break;
              case '/about':
                page = const AboutScreen();
                break;
              case '/skills':
                page = const SkillsScreen();
                break;
              case '/experience':
                page = const ExperienceScreen();
                break;
              default:
                page = const HomeScreen();
            }

            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => page,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
              transitionDuration: const Duration(milliseconds: 300),
            );
          },
        );
      },
    );
  }
}
