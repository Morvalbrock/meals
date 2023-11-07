import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 131, 57, 0),
    brightness: Brightness.dark,
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const MealsScreen(
        title: 'Some Catogary',
        meal: dummyMeals,
      ),
    );
  }
}
