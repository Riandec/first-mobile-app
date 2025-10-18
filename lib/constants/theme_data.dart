import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData.light().copyWith();

ThemeData darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Colors.blueGrey[900],
  appBarTheme: AppBarTheme(backgroundColor: Colors.grey[800])
);