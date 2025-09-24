import 'package:first_application/api/api_assignment.dart';
import 'package:flutter/material.dart';
// import 'package:first_application/week2.dart';
// import 'package:first_application/week3.dart';
// import 'package:first_application/week4.dart';
// import 'package:first_application/navigation/first_page.dart';
// import 'package:first_application/navigation/second_page.dart';
// import 'package:first_application/api/api_example.dart';
import 'package:first_application/api/api_assignment.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: true,
      /*
      // Named Route
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstPage(),
        '/second': (context) => const SecondPage(),
      },
      // If you use 'home', do not use 'initialRoute', its overlap
      */
      home: const ApiAssign(),
    );
  }
}
