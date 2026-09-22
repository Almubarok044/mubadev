import 'package:flutter/material.dart';
import 'package:mubadev/core/theme/app_colors.dart';

class InteractiveCursor extends StatefulWidget {
  final Widget child;
  
  static final ValueNotifier<bool> isHoveringObject = ValueNotifier<bool>(false);

  const InteractiveCursor({super.key, required this.child});

  @override
  State<InteractiveCursor> createState() => _InteractiveCursorState();
}

class _InteractiveCursorState extends State<InteractiveCursor> {
  final ValueNotifier<Offset> _mousePosition = ValueNotifier<Offset>(Offset.zero);
  final ValueNotifier<bool> _isVisible = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _mousePosition.dispose();
    _isVisible.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Only show custom cursor on non-mobile screens
    final isMobile = MediaQuery.of(context).size.shortestSide < 600;
    if (isMobile) {
      return widget.child;
    }

    return MouseRegion(
      cursor: SystemMouseCursors.none,
      onHover: (event) {
        _mousePosition.value = event.position;
        if (!_isVisible.value) _isVisible.value = true;
      },
      onExit: (_) => _isVisible.value = false,
      child: Stack(
        children: [
          // 1. Content layer
          widget.child,

          // 2. Cursor follower layer (isolated in RepaintBoundary)
          Positioned.fill(
            child: IgnorePointer(
              child: RepaintBoundary(
                child: ValueListenableBuilder<bool>(
                  valueListenable: _isVisible,
                  builder: (context, visible, _) {
                    return ValueListenableBuilder<bool>(
                      valueListenable: InteractiveCursor.isHoveringObject,
                      builder: (context, isHoveringObject, _) {
                        // Sembunyikan animasi bulat saat kursor keluar layar
                        // atau saat berada di atas tombol aktif (isHoveringObject)
                        if (!visible || isHoveringObject) {
                          return const SizedBox.shrink();
                        }

                        return ValueListenableBuilder<Offset>(
                          valueListenable: _mousePosition,
                          builder: (context, pos, _) {
                            return Stack(
                              children: [
                                AnimatedPositioned(
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.easeOutCubic,
                                  left: pos.dx - 16,
                                  top: pos.dy - 16,
                                  child: Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColors.primary.withValues(
                                          alpha: 0.55,
                                        ),
                                        width: 2,
                                      ),
                                      color: AppColors.primary.withValues(
                                        alpha: 0.15,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CursorHideRegion extends StatelessWidget {
  final Widget child;
  const CursorHideRegion({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => InteractiveCursor.isHoveringObject.value = true,
      onExit: (_) => InteractiveCursor.isHoveringObject.value = false,
      child: child,
    );
  }
}
