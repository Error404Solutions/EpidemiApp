import 'package:flutter/material.dart';
import 'package:flutter_application_1/auto/config/theme/app_theme.dart';
import 'package:flutter_application_1/auto/presentation/buttons/buttons_screen.dart';
import 'package:flutter_application_1/auto/presentation/screens/home/cards/cards_screen.dart';
import 'package:flutter_application_1/auto/presentation/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 3).getTheme(),
      home: const HomeScreen(),
      routes: {
        '/buttons': (context) => const ButtonsScreens(),
        '/cards': (context) => const CardsScreen(),
      },
    );
  }
}
