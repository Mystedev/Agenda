import 'package:flutter/material.dart';

// Tema claro
final ThemeData lightTheme = ThemeData(
  primarySwatch: const MaterialColor(0xFF004d40, {
    50: Color(0xFFE0F2F1),
    100: Color(0xFFB2DFDB),
    200: Color(0xFF80CBC4),
    300: Color(0xFF4DB6AC),
    400: Color(0xFF26A69A),
    500: Color(0xFF009688),
    600: Color(0xFF00897B),
    700: Color(0xFF00796B),
    800: Color(0xFF00695C),
    900: Color(0xFF004d40),
  }),
  scaffoldBackgroundColor: Color.fromARGB(255, 239, 239, 239),
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor:Color.fromARGB(255, 239, 239, 239),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Colors.black),
  ),
  cardTheme: const CardTheme(
    color: Color.fromARGB(255, 239, 239, 239),
    shadowColor: Colors.black12,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xFF004d40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: const Color(0xFF004d40),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFFFECB3),
    foregroundColor: Colors.black,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Colors.black,
      fontSize: 22,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    bodySmall: TextStyle(
      color: Color.fromARGB(255, 68, 68, 68),
      fontSize: 14,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Color(0xFF004d40),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF004d40)),
    ),
    labelStyle: TextStyle(
      color: Color(0xFF004d40),
    ),
    prefixIconColor: Color(0xFF80CBC4),
    suffixIconColor: Color(0xFF80CBC4),
  ),
);

// Tema oscuro
final ThemeData darkTheme = ThemeData(
  primarySwatch: const MaterialColor(0xFF004d40, {
    50: Color(0xFFE0F2F1),
    100: Color(0xFFB2DFDB),
    200: Color(0xFF80CBC4),
    300: Color(0xFF4DB6AC),
    400: Color(0xFF26A69A),
    500: Color(0xFF009688),
    600: Color(0xFF00897B),
    700: Color(0xFF00796B),
    800: Color(0xFF00695C),
    900: Color(0xFF004d40),
  }),
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color.fromARGB(255, 18, 18, 18),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  cardTheme: const CardTheme(
    color: Color(0xFF101010),
    shadowColor: Colors.black54,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xFF004d40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xFF004d40),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFFFECB3),
    foregroundColor: Colors.black,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 22,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 16,
    ),
    bodySmall: TextStyle(
      color: Colors.white70,
      fontSize: 14,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFE91E63)),
    ),
    labelStyle: TextStyle(color: Colors.white),
    prefixIconColor: Color(0xFF80CBC4),
    suffixIconColor: Color(0xFF80CBC4),
  ),
);
