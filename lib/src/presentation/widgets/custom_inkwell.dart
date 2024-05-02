import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomInkWell extends HookWidget {
  const CustomInkWell({
    super.key,
    this.borderRadius,
    required this.onTap,
    required this.child,
  });
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final bumpAnimation = useAnimationController(
      duration: const Duration(milliseconds: 100),
      lowerBound: 0,
      upperBound: .05,
    );

    void driveAnimation() {
      if (bumpAnimation.isAnimating) {
        bumpAnimation.reverse().then((value) => driveAnimation());
      } else {
        bumpAnimation.forward().then((value) => bumpAnimation.reverse());
      }
    }

    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: Stack(
        children: [
          AnimatedBuilder(
              animation: bumpAnimation,
              builder: (context, _) {
                return Transform.scale(
                  scale: 1 - bumpAnimation.value,
                  child: child,
                );
              }),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onLongPress: () {
                  driveAnimation();
                },
                onTap: () {
                  driveAnimation();
                  onTap?.call();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
