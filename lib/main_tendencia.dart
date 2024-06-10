import 'package:flutter/material.dart';
import 'screens/tendencias_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dengue App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TendenciasScreen(),
    );
  }
}