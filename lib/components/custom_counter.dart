import 'package:flutter/material.dart';

class CustomCounter extends StatefulWidget {
  final String title;
  final Color bgColor;

  const CustomCounter({super.key, required this.title, required this.bgColor});

  @override
  State<CustomCounter> createState() => _CustomCounterState();
}

class _CustomCounterState extends State<CustomCounter> {
  int _counter = 0;

  void _incrementCouter() {
    setState(() => _counter++);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${widget.title}: $_counter',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: _incrementCouter, child: const Text('Increment')),
        ],
      )
    );
  }
}