import 'dart:async';
import 'package:flutter/material.dart';

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

class _InfiniteMarqueeState extends State<InfiniteMarquee> {
  late ScrollController _scrollController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startScrolling();
    });
  }

  void _startScrolling() {
    const int fps = 60;
    const int delayMs = 1000 ~/ fps;
    final double step = widget.velocity / fps;

    _timer = Timer.periodic(const Duration(milliseconds: delayMs), (timer) {
      if (_scrollController.hasClients) {
        double offset = _scrollController.offset + step;
        _scrollController.jumpTo(offset);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
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
