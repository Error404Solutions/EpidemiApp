import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mapa del Dengue',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
    Localidad('Localidad 1', 10),
    Localidad('Localidad 2', 5),
    Localidad('Localidad 3', 15),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa del Dengue'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Tabla de casos de dengue por localidad',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                DataTable(
                  columns: const [
                    DataColumn(label: Text('Localidad')),
                    DataColumn(label: Text('Casos')),
                  ],
                  rows: localidades
                      .map(
                        (localidad) => DataRow(
                          cells: [
                            DataCell(Text(localidad.nombre)),
                            DataCell(Text(localidad.casos.toString())),
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
              ElevatedButton(
                onPressed: () {},
                child: const Text('Duración'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Ubicación'),
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
              label: const Text('Denunciar foco'),
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

  Localidad(this.nombre, this.casos);
}
