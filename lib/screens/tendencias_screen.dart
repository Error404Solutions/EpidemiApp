import 'package:flutter/material.dart';
import '../models/tendencias.dart';
import '../widgets/tendencias_chart.dart';

class TendenciasScreen extends StatelessWidget {
  final List<Tendencia> data = [
    Tendencia(date: '1', casosPositivos: 5, casosSospechosos: 3),
    Tendencia(date: '2', casosPositivos: 3, casosSospechosos: 4),
    Tendencia(date: '3', casosPositivos: 8, casosSospechosos: 5),
    Tendencia(date: '4', casosPositivos: 6, casosSospechosos: 7),
    Tendencia(date: '5', casosPositivos: 7, casosSospechosos: 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tendencias'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Segundos al Aedes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () {
                    // Implementar lógica para filtros
                  },
                )
              ],
            ),
            Expanded(
              child: TendenciasChart(data: data),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implementar lógica para registrar caso positivo
              },
              child: Text('Registrar Caso Positivo'),
            ),
          ],
        ),
      ),
    );
  }
}
