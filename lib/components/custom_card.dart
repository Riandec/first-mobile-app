import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final Color color;
  const CustomCard({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }
}
