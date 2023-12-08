import 'package:flutter/material.dart';

class AppCircularProgressIndicator extends StatefulWidget {
  const AppCircularProgressIndicator({
    Key? key,
    this.size,
    this.color,
    this.margin,
  }) : super(key: key);
  final double? size;
  final Color? color;
  final EdgeInsets? margin;

  @override
  State<AppCircularProgressIndicator> createState() =>
      _AppCircularProgressIndicatorState();
}

class _AppCircularProgressIndicatorState
    extends State<AppCircularProgressIndicator> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1, milliseconds: 400),
    vsync: this,
  )..repeat(reverse: false);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  void initState() {
    super.initState();
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.size == null
        ? Center(
            child: Container(
              margin: widget.margin,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: widget.color ?? Colors.blue,
              ),
            ),
          )
        : Center(
            child: Container(
              width: widget.size,
              height: widget.size,
              margin: widget.margin,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: widget.color ?? Colors.blue,
              ),
            ),
          );
  }
}
