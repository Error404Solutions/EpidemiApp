import 'package:flutter/material.dart';
import '../models/tendencias.dart';
import '../widgets/tendencias_chart.dart';

class TendenciasScreen extends StatelessWidget {
  final List<Tendencia> data = [
    Tendencia(mes: 'Enero', casosPositivos: 5, casosSospechosos: 3, tipo: 'A. Potenciales'),
    Tendencia(mes: 'Febrero', casosPositivos: 7, casosSospechosos: 6, tipo: 'A. Potenciales'),
    Tendencia(mes: 'Marzo', casosPositivos: 3, casosSospechosos: 8, tipo: 'A. Potenciales'),
    Tendencia(mes: 'Abril', casosPositivos: 6, casosSospechosos: 4, tipo: 'A. Potenciales'),
    Tendencia(mes: 'Mayo', casosPositivos: 9, casosSospechosos: 7, tipo: 'B. Gubernamental'),
    Tendencia(mes: 'Junio', casosPositivos: 8, casosSospechosos: 9, tipo: 'B. Gubernamental'),
    Tendencia(mes: 'Julio', casosPositivos: 7, casosSospechosos: 6, tipo: 'B. Gubernamental'),
  ];

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Comuna 1, BA'),
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
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('# Días'),
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
                      child: Text('# Meses'),
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
                      child: Text('# Años'),
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
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue[800],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('SEGUIMOS AL AEDES', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Expanded(child: TendenciasChart(data: data)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: List.generate(6, (index) {
                  var labels = ['Pie', 'Polar', 'Line', 'Radar', 'Bar', 'Horizontal'];
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: labels[index] == 'Line' ? 4 : 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        child: Text(labels[index], style: TextStyle(color: labels[index] == 'Line' ? Colors.blue[800] : Colors.grey)),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: Text('REGISTRAR CASO POSITIVO', style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ],
          ),
        ),
      );
    }
  }