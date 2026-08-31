import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../core/widgets/page_layout.dart';
import '../../../core/theme/app_colors.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final experiences = [
      {
        'period': '2024 - Present',
        'title': 'Senior Flutter Developer',
        'body':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      },
      {
        'period': '2022 - 2024',
        'title': 'Mobile App Engineer',
        'body':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur blandit tempus porttitor. Cras mattis consectetur purus sit amet fermentum. Donec sed odio dui. Nullam id dolor id nibh ultricies vehicula ut id elit.',
      },
      {
        'period': '2020 - 2022',
        'title': 'Frontend Developer',
        'body':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.',
      },
      // {
      //   'period': '2018 - 2020',
      //   'title': 'UI/UX Designer',
      //   'body':
      //       'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas faucibus mollis interdum. Vestibulum id ligula porta felis euismod semper. Donec ullamcorper nulla non metus auctor fringilla.',
      // },
    ];

    return PageLayout(
      activeMenu: 'Pengalaman',
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),

                // ==================================================
                // TITLE
                // ==================================================
                Text(
                  tr('exp_title'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textMain(context),
                  ),
                ),

                const SizedBox(height: 16),

                // ==================================================
                // DESCRIPTION
                // ==================================================
                Text(
                  tr('exp_desc'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary(context),
                  ),
                ),

                const SizedBox(height: 48),

                // ==================================================
                // EXPERIENCE TIMELINE
                // ==================================================
                LayoutBuilder(
                  builder: (context, constraints) {
                    final isCompact = constraints.maxWidth < 760;

                    return Column(
                      children: List.generate(experiences.length, (index) {
                        final experience = experiences[index];
                        final isLeft = index.isEven;

                        // ==================================================
                        // MOBILE / COMPACT
                        // ==================================================

                        if (isCompact) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 28),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 42,
                                  child: Center(child: TimelineRail()),
                                ),

                                const SizedBox(width: 12),

                                Expanded(
                                  child: ExperienceCard(
                                    period: experience['period'] as String,
                                    title: experience['title'] as String,
                                    body: experience['body'] as String,
                                    isLeft: false,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        // ==================================================
                        // DESKTOP / TABLET
                        // ==================================================

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 28),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // ==================================================
                              // LEFT SIDE
                              // ==================================================
                              Expanded(
                                child: Align(
                                  alignment: isLeft
                                      ? Alignment.centerRight
                                      : Alignment.center,
                                  child: isLeft
                                      ? ExperienceCard(
                                          period:
                                              experience['period'] as String,
                                          title: experience['title'] as String,
                                          body: experience['body'] as String,
                                          isLeft: true,
                                        )
                                      : const SizedBox.shrink(),
                                ),
                              ),

                              const SizedBox(width: 18),

                              // ==================================================
                              // TIMELINE
                              // ==================================================
                              SizedBox(
                                width: 78,
                                child: Center(child: TimelineRail()),
                              ),

                              const SizedBox(width: 18),

                              // ==================================================
                              // RIGHT SIDE
                              // ==================================================
                              Expanded(
                                child: Align(
                                  alignment: isLeft
                                      ? Alignment.center
                                      : Alignment.centerLeft,
                                  child: isLeft
                                      ? const SizedBox.shrink()
                                      : ExperienceCard(
                                          period:
                                              experience['period'] as String,
                                          title: experience['title'] as String,
                                          body: experience['body'] as String,
                                          isLeft: false,
                                        ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// EXPERIENCE CARD
// ============================================================

class ExperienceCard extends StatefulWidget {
  final String period;
  final String title;
  final String body;
  final bool isLeft;

  const ExperienceCard({
    super.key,
    required this.period,
    required this.title,
    required this.body,
    required this.isLeft,
  });

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _hovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _hovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,

        constraints: const BoxConstraints(maxWidth: 430, minHeight: 220),

        transform: Matrix4.translationValues(0, _hovered ? -4 : 0, 0),

        padding: const EdgeInsets.all(22),

        decoration: BoxDecoration(
          color: AppColors.surface(context),
          borderRadius: BorderRadius.circular(22),

          border: Border.all(
            color: _hovered
                ? AppColors.primary.withValues(alpha: 0.7)
                : AppColors.divider(context),
            width: _hovered ? 1.5 : 1,
          ),

          boxShadow: [
            BoxShadow(
              color: _hovered
                  ? AppColors.primary.withValues(alpha: 0.14)
                  : Colors.black.withValues(alpha: 0.04),
              blurRadius: _hovered ? 18 : 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),

        // ==================================================
        // CARD CONTENT
        // ==================================================
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==================================================
            // PERIOD
            // ==================================================
            Text(
              widget.period,
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 12,
                letterSpacing: 1.1,
              ),
            ),

            const SizedBox(height: 10),

            // ==================================================
            // TITLE
            // ==================================================
            Text(
              widget.title,
              style: TextStyle(
                color: AppColors.textMain(context),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // ==================================================
            // DESCRIPTION
            // ==================================================
            Text(
              widget.body,
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.textSecondary(context),
                fontSize: 15,
                height: 1.7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// TIMELINE RAIL
// ============================================================

class TimelineRail extends StatefulWidget {
  const TimelineRail({super.key});

  @override
  State<TimelineRail> createState() => _TimelineRailState();
}

class _TimelineRailState extends State<TimelineRail>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final glow =
            0.6 + (math.sin(_controller.value * math.pi * 2) + 1) * 0.2;

        return SizedBox(
          width: 78,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ==================================================
              // TIMELINE DOT
              // ==================================================
              Transform.scale(
                scale: 0.9 + glow * 0.2,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.45),
                        blurRadius: 14 + glow * 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // ==================================================
              // TIMELINE LINE
              // ==================================================
              Container(
                width: 3,
                height: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.primary.withValues(alpha: 0.25),
                      AppColors.primary.withValues(alpha: 0.8),
                      AppColors.primary.withValues(alpha: 0.25),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.18),
                      blurRadius: 12,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
