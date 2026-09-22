import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class InfiniteMarquee extends StatefulWidget {
  final List<Widget> items;
  final bool reverse;
  final double velocity;
  final double height;
  final double spacing;

  const InfiniteMarquee({
    super.key,
    required this.items,
    this.reverse = false,
    this.velocity = 50.0, // pixels per second
    this.height = 80.0,
    this.spacing = 24.0,
  });

  @override
  State<InfiniteMarquee> createState() => _InfiniteMarqueeState();
}

class _InfiniteMarqueeState extends State<InfiniteMarquee>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;
  Ticker? _ticker;
  Duration _lastElapsed = Duration.zero;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _ticker = createTicker(_onTick);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _ticker != null && !_ticker!.isActive) {
        _ticker!.start();
      }
    });
  }

  void _onTick(Duration elapsed) {
    if (!mounted || !_scrollController.hasClients) {
      _lastElapsed = elapsed;
      return;
    }

    final double deltaSeconds =
        (elapsed - _lastElapsed).inMicroseconds / 1000000.0;
    _lastElapsed = elapsed;

    // Filter out huge initial frame hitch or paused tab
    if (deltaSeconds <= 0 || deltaSeconds > 0.1) return;

    if (_scrollController.position.hasContentDimensions) {
      final double step = widget.velocity * deltaSeconds;
      final double newOffset = _scrollController.offset + step;
      try {
        _scrollController.jumpTo(newOffset);
      } catch (_) {
        // Safe guard against view disposal during hot reload/restart
      }
    }
  }

  @override
  void dispose() {
    _ticker?.stop();
    _ticker?.dispose();
    _ticker = null;
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) return SizedBox(height: widget.height);

    return SizedBox(
      height: widget.height,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        reverse: widget.reverse,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final item = widget.items[index % widget.items.length];
          return Padding(
            padding: EdgeInsets.only(
              left: widget.reverse ? 0 : widget.spacing,
              right: widget.reverse ? widget.spacing : 0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: item,
            ),
          );
        },
      ),
    );
  }
}
