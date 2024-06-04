import 'package:flutter/material.dart';
import '../models/tendencias.dart';
import '../widgets/tendencias_chart.dart';

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

  String _currentChartType = 'Line';

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
              decoration: InputDecoration(
                hintText: 'Buscar País',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('# Meses', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('# Años', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
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
                _buildChartTypeButton('Pie', 'Torta'),
                _buildChartTypeButton('Polar', 'Polar'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acción para registrar un caso positivo
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