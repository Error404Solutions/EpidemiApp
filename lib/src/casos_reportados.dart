import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../screens/tendencias_screen.dart';  // Importa la pantalla de tendencias

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const name = 'myapp';
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tabla del Dengue',
      theme: ThemeData(
        primarySwatch: Colors.red,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
      ),
      home: const PantallaPrincipal(),
    );
  }
}

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  List<Localidad> localidades = [];

  @override
  void initState() {
    super.initState();
    fetchLocalidades();
  }

  Future<void> fetchLocalidades() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:8000/api/denunciaFocoUbicacion'));
      
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        print(data);  // Agregar esta línea para depuración
        setState(() {
          localidades = data.map((json) => Localidad.fromJson(json)).toList();
        });
      } else {
        throw Exception('Error al cargar localidades');
      }
    } catch (e) {
      print('Error fetching localidades: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabla del Dengue'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Tabla de casos de dengue por localidad',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'En lo que va de la presente temporada 2023/2024',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                DataTable(
                  columns: const [
                    DataColumn(label: Text('Localidad')),
                    DataColumn(label: Text('Casos')),
                    DataColumn(label: Text('Distancia (km)')), // Nueva columna de distancia
                  ],
                  rows: localidades
                      .map(
                        (localidad) => DataRow(
                          cells: [
                            DataCell(Text(localidad.nombre)),
                            DataCell(Text(localidad.casos.toString())),
                            DataCell(Text(localidad.distancia.toString())), // Nueva celda de distancia
                          ],
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0), // Espacio entre la tabla y el botón
          Center(
            child: SizedBox(
              width: 200,
              height: 50,
              child: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TendenciasScreen()),
                  );
                },
                label: const Text('TENDENCIAS'),
                icon: const Icon(Icons.show_chart), // Icono de gráfica
              ),
            ),
          ),
          const SizedBox(height: 20.0), // Espacio entre el botón y el final de la página
        ],
      ),
    );
  }
}

class Localidad {
  final String nombre;
  final int casos;
  final double distancia;

  Localidad({required this.nombre, required this.casos, required this.distancia});

  factory Localidad.fromJson(Map<String, dynamic> json) {
    return Localidad(
      nombre: json['ubicacion'],
      casos: json['count'],
      distancia: json['distancia'],
    );
  }
}
