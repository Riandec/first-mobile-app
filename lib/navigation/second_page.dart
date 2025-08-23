import 'package:first_application/navigation/first_page.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String name;
  const SecondPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        backgroundColor: Colors.yellowAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: $name'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('< First Page')
            )
          ],
        ),
      ),
    );
  }
}