import 'package:flutter/material.dart';
// import 'package:first_application/week2.dart';
// import 'package:first_application/week3.dart';
// import 'package:first_application/week4.dart';
// import 'package:first_application/navigation/first_page.dart';
// import 'package:first_application/navigation/second_page.dart';
// import 'package:first_application/api/api_example.dart';
// import 'package:first_application/api/api_assignment.dart';
// import 'package:first_application/api/restapi_week5.dart';
import 'week6.dart';
import 'package:first_application/constants/theme_data.dart';

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
      /* Named Route
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstPage(),
        '/second': (context) => const SecondPage(),
      },
      // If you use 'home', do not use 'initialRoute', its overlap
      */
      home: const TrafficLight(),
    );
  }
}

/* Stf MyApp
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // default: light theme
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      _themeMode =
          (_themeMode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // set theme here
      themeMode: _themeMode,

      darkTheme: darkTheme,
      theme: lightTheme,

      home: SwitchTheme(switchMode: toggleTheme),
    );
  }
}
*/
