import 'package:flutter/material.dart';

class AnimatedObject extends StatefulWidget {
  final Size size;
  final Duration duration;
  late Curve? curve;
  late Color? color;
  late BorderRadius? borderRadius;
  AnimatedObject(
      {Key? key,
      required this.size,
      required this.duration,
      this.curve,
      this.color,
      this.borderRadius})
      : super(key: key);

  @override
  _AnimatedObjectState createState() => _AnimatedObjectState();
}

class _AnimatedObjectState extends State<AnimatedObject>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    final curvedAnimation = CurvedAnimation(
        parent: _animationController,
        curve: widget.curve ?? Curves.easeInOutCubic);

    _animation = Tween<double>(begin: 0, end: widget.size.height)
        .animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      height: _animation.value,
      decoration: BoxDecoration(
          color: widget.color ?? Colors.white,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(0)),
    );
  }
}
