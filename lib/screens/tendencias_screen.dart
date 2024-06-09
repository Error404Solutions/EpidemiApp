import 'package:flutter/material.dart';
import '../models/tendencias.dart';
import '../models/localidad_info.dart';
import '../widgets/tendencias_chart.dart';
import '../widgets/localidad_table.dart';
import 'denuncia_screen.dart';

class TendenciasScreen extends StatefulWidget {
  @override
  _TendenciasScreenState createState() => _TendenciasScreenState();
}

class _TendenciasScreenState extends State<TendenciasScreen> {
  final List<Tendencia> data = [
    Tendencia(mes: 'Enero', casosPositivos: 5, casosSospechosos: 3, tipo: 'A. Potenciales'),
    Tendencia(mes: 'Febrero', casosPositivos: 7, casosSospechosos: 6, tipo: 'A. Potenciales'),
    Tendencia(mes: 'Marzo', casosPositivos: 3, casosSospechosos: 8, tipo: 'A. Potenciales'),
    Tendencia(mes: 'Abril', casosPositivos: 6, casosSospechosos: 4, tipo: 'A. Potenciales'),
    Tendencia(mes: 'Mayo', casosPositivos: 9, casosSospechosos: 7, tipo: 'B. Gubernamental'),
    Tendencia(mes: 'Junio', casosPositivos: 8, casosSospechosos: 9, tipo: 'B. Gubernamental'),
    Tendencia(mes: 'Julio', casosPositivos: 7, casosSospechosos: 6, tipo: 'B. Gubernamental'),
  ];

  final List<LocalidadInfo> localidades = [
    LocalidadInfo(nombre: 'Localidad 1', casos: 10, distancia: '5 km'),
    LocalidadInfo(nombre: 'Localidad 2', casos: 5, distancia: '10 km'),
    LocalidadInfo(nombre: 'Localidad 3', casos: 15, distancia: '3 km'),
    LocalidadInfo(nombre: 'Localidad 4', casos: 3, distancia: '5 Km'),
    LocalidadInfo(nombre: 'Localidad 5', casos: 21, distancia: '20 Km'),
  ];

  String _currentChartType = 'Line';
  LocalidadInfo? selectedLocalidad;
  TextEditingController searchController = TextEditingController();

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
              onSubmitted: (value) {
                setState(() {
                  selectedLocalidad = localidades.firstWhere(
                    (loc) => loc.nombre.toLowerCase() == value.toLowerCase(),
                    orElse: () => LocalidadInfo(nombre: 'No encontrada', casos: 0, distancia: '0 Km'),
                  );
                });
              },
            ),
            SizedBox(height: 20),
            if (selectedLocalidad != null) ...[
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
                  borderRadius: BorderRadius.circular(20), // Radio de borde de 20
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TendenciasChart(data: data, chartType: _currentChartType),
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
