import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer(
      {super.key,
      required this.startColor,
      required this.endColor,
      this.child});

  final Color startColor;
  final Color endColor;
  final Widget? child;

  @override
  Widget build(context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [startColor, endColor],
        ),
      ),
      child: child,
    );
  }
}
