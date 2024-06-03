import 'package:flutter/material.dart';
import 'main_denuncia.dart' as main_denuncia;
import 'src/informacion_dengue.dart';
import 'main_tendencia.dart' as main_tendencia;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dengue App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dengue App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => main_denuncia.MyApp()));
              },
              child: Text('Ir a Denuncias'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => main_tendencia.MyApp()));
              },
              child: Text('Ir a Tendencias'),
            ),
          ],
        ),
      ),
    );
  }
}
