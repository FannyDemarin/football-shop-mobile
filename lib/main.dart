import 'package:flutter/material.dart';
import 'package:football_shop/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Shop',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white, // fond blanc
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF0D1B2A), // bleu foncé principal
          secondary: Color(0xFF1B263B), // bleu plus clair pour accents
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0D1B2A), // bleu foncé
          foregroundColor: Colors.white, // texte blanc
          centerTitle: true,
          elevation: 4,
          shadowColor: Colors.black45,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF0D1B2A), // même couleur que l'AppBar
            foregroundColor: Colors.white, // texte blanc
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}