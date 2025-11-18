import 'package:flutter/material.dart';
import 'package:football_shop/screens/menu.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:football_shop/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Football Shop',
        theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white, // fond blanc
          colorScheme: const ColorScheme.light(
            primary: Color(0xFF0D1B2A), // bleu foncé principal
            secondary: Color(0xFF1B263B), // bleu plus clair pour accents
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF203A52), // bleu foncé
            foregroundColor: Colors.white, // texte blanc
            centerTitle: true,
            elevation: 0,
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
        home: const LoginPage(),
      ),
    );
  }
}
