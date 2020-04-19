import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  final bool isCollapsed;
  final double screenWidth, screenHeight;
  final Duration duration;
  final AnimationController controller;
  final Animation<double> scaleAnimation;
  final Color backgroundColor;
  final Widget child;

  const Dashboard({
    Key key,
    this.isCollapsed,
    this.screenWidth,
    this.screenHeight,
    this.duration,
    this.controller,
    this.scaleAnimation,
    this.backgroundColor,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          elevation: 8,
          color: backgroundColor,
          child: child,
        ),
      ),
    );
  }
}
