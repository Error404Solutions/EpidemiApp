import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/tendencias.dart';
import '../models/localidad_info.dart';
import '../widgets/tendencias_chart.dart';
import '../widgets/localidad_table.dart';
import '../src/services/api_service.dart';
import 'denuncia_screen.dart';

class TendenciasScreen extends StatefulWidget {
  @override
  _TendenciasScreenState createState() => _TendenciasScreenState();
}

class _TendenciasScreenState extends State<TendenciasScreen> {
  List<Tendencia> data = [];
  List<LocalidadInfo> localidades = [];
  String _currentChartType = 'Line';
  LocalidadInfo? selectedLocalidad;
  TextEditingController searchController = TextEditingController();
  ApiService apiService = ApiService('http://10.0.2.2:8000');

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      List<dynamic> denunciasFoco = await apiService.listarDenunciasUbic();
      print('Datos de denunciasFoco: $denunciasFoco');

      List<dynamic> denunciasPersona = await apiService.listarDenunciasPoUbic();
      print('Datos de denunciasPersona: $denunciasPersona');

      Map<String, LocalidadInfo> localidadesMap = {};

      for (var item in denunciasFoco) {
        localidadesMap[item['ubicacion'] ?? 'Desconocido'] = LocalidadInfo(
          nombre: item['ubicacion'] ?? 'Desconocido',
          casosPositivos: item['count'],
          casosPotenciales: 0,
        );
      }

      for (var item in denunciasPersona) {
        if (localidadesMap.containsKey(item['ubicacion'])) {
          var localidad = localidadesMap[item['ubicacion']]!;
          localidadesMap[item['ubicacion']] = LocalidadInfo(
            nombre: localidad.nombre ?? 'Desconocido',
            casosPositivos: localidad.casosPositivos,
            casosPotenciales: item['count'],
          );
        } else {
          localidadesMap[item['ubicacion'] ?? 'Desconocido'] = LocalidadInfo(
            nombre: item['ubicacion'] ?? 'Desconocido',
            casosPositivos: 0,
            casosPotenciales: item['count'],
          );
        }
      }

      setState(() {
        localidades = localidadesMap.values.toList();
        data = localidadesMap.values.expand((localidad) => [
          Tendencia(
            mes: localidad.nombre ?? 'Desconocido',
            tipo: 'Casos Positivos',
            casosPositivos: localidad.casosPositivos,
            casosSospechosos: localidad.casosPotenciales,
          ),
          Tendencia(
            mes: localidad.nombre ?? 'Desconocido',
            tipo: 'Casos Potenciales',
            casosPositivos: localidad.casosPositivos,
            casosSospechosos: localidad.casosPotenciales,
          ),
        ]).toList();
      });


      print('Localidades combinadas: $localidades');
      print('Datos de tendencias: $data');
    } catch (e) {
      print('Error: $e');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tendencias'),
        actions: [IconButton(icon: Icon(Icons.notifications), onPressed: () {})],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Buscar localidad por nombre',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onChanged: (value) {
                setState(() {
                  selectedLocalidad = null; // Reiniciar la selección al cambiar el texto de búsqueda
                });
              },
              onSubmitted: (value) async {
                String lowercaseValue = value.toLowerCase();
                // Buscar la localidad que coincide con el valor ingresado (insensible a mayúsculas/minúsculas)
                var matchingLocalities = localidades.where((loc) => loc.nombre?.toLowerCase().contains(lowercaseValue) ?? false).toList();
                if (matchingLocalities.isNotEmpty) {
                  setState(() {
                    // Establecer la primera coincidencia como la localidad seleccionada
                    selectedLocalidad = matchingLocalities.first;
                  });
                  print('Localidad encontrada: ${selectedLocalidad!.nombre}');
                } else {
                  // Mostrar la tabla con la información de "No encontrada"
                  setState(() {
                    selectedLocalidad = LocalidadInfo(
                      nombre: 'No encontrada',
                      casosPositivos: 0,
                      casosPotenciales: 0,
                    );
                  });
                  print('Localidad no encontrada');
                }
              },
            ),
            SizedBox(height: 20),
            if (selectedLocalidad != null && selectedLocalidad!.nombre != 'No encontrada') ...[
              Text('Información de la Localidad', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              LocalidadTable(localidad: selectedLocalidad!),
              SizedBox(height: 20),
            ] else if (selectedLocalidad != null) ...[
              Text('Información de la Localidad', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              LocalidadTable(localidad: selectedLocalidad!),
              SizedBox(height: 20),
            ],
            Expanded(
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.blue[800],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: data.isNotEmpty 
                    ? TendenciasChart(data: data, chartType: _currentChartType)
                    : Center(child: Text('No hay datos para mostrar', style: TextStyle(color: Colors.white))),
                ),
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              alignment: WrapAlignment.center,
              children: [
                _buildChartTypeButton('Line', 'Linea'),
                _buildChartTypeButton('Bar', 'Barras'),
                _buildChartTypeButton('Pie', 'Circular'),
                _buildChartTypeButton('Polar', 'Pastel'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DenunciaScreen()),
                );
              },
              child: Text('REGISTRAR CASO POSITIVO', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChartTypeButton(String type, String label) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _currentChartType = type;
        });
      },
      child: Text(label, style: TextStyle(color: Colors.black)),
      style: ElevatedButton.styleFrom(
        backgroundColor: _currentChartType == type ? Colors.blue[800] : Colors.grey[300],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        textStyle: TextStyle(fontSize: 12),
      ),
    );
  }
}
