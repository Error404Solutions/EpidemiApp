import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  List<Localidad> localidades = [
    Localidad('Localidad 1', 10, 5.2),
    Localidad('Localidad 2', 5, 8.1),
    Localidad('Localidad 3', 15, 3.7),
    Localidad('Localidad 4', 6, 12.5),
    Localidad('Localidad 5', 14, 7.9),
    Localidad('Localidad 6', 8, 6.3),
    Localidad('Localidad 7', 1, 10.8),
    Localidad('Localidad 8', 20, 2.4),
    Localidad('Localidad 9', 9, 9.6),
    Localidad('Localidad 10', 11, 4.5),
    Localidad('Localidad 11', 15, 6.7),
    Localidad('Localidad 12', 2, 11.2),
  ];

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
                    DataColumn(
                        label: Text(
                            'Distancia (km)')), // Nueva columna de distancia
                  ],
                  rows: localidades
                      .map(
                        (localidad) => DataRow(
                          cells: [
                            DataCell(Text(localidad.nombre)),
                            DataCell(Text(localidad.casos.toString())),
                            DataCell(Text(localidad.distancia
                                .toString())), // Nueva celda de distancia
                          ],
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Distancia'),
              ),
              TextButton(
                onPressed: () {
                  // Navegar a la pantalla de tendencias
                },
                child: const Text(
                  'Consulta tendencias',
                  style: TextStyle(
                    color: Color.fromARGB(255, 214, 79, 25),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            width: 200,
            height: 50,
            child: FloatingActionButton.extended(
              onPressed: () {
                // Navegar a la pantalla para denunciar un foco
              },
              label: const Text('DENUNCIAR FOCO'),
              icon: const Icon(Icons.report),
            ),
          ),
        ],
      ),
    );
  }
}

class Localidad {
  final String nombre;
  final int casos;
  final double distancia;

  Localidad(this.nombre, this.casos, this.distancia);
}
