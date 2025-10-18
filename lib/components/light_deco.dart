import 'package:flutter/material.dart';

class LightDeco extends StatelessWidget {
  final Color lightColor;
  final double opacity;
  const LightDeco({super.key, required this.lightColor, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 500),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: lightColor,
          boxShadow: [
            BoxShadow(
              color: lightColor.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 10,
            )
          ],
        ),
      ),
    );
  }
}