import 'package:flutter/material.dart';

class AnimatedLike extends StatefulWidget {
  const AnimatedLike({
    Key? key,
    required this.child,
    required this.isAnimating,
    this.smallLike = false,
    this.duration = const Duration(milliseconds: 150),
    this.onEnd,
  }) : super(key: key);

  final Widget child;
  final bool isAnimating;
  final bool smallLike;
  final Duration duration;
  final VoidCallback? onEnd;

  @override
  _AnimatedLikeState createState() => _AnimatedLikeState();
}

class _AnimatedLikeState extends State<AnimatedLike>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: widget.duration.inMilliseconds ~/ 2,
      ),
    );
    scale = Tween<double>(
      begin: 1,
      end: 1.2,
    ).animate(animationController);
  }

  @override
  void didUpdateWidget(covariant AnimatedLike oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isAnimating != oldWidget.isAnimating) {
      startAnimation();
    }
  }

  startAnimation() async {
    if (widget.isAnimating || widget.smallLike) {
      await animationController.forward();
      await animationController.reverse();
      await Future.delayed(
        const Duration(
          milliseconds: 200,
        ),
      );
      if (widget.onEnd != null) {
        widget.onEnd!();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scale,
      child: widget.child,
    );
  }
}
