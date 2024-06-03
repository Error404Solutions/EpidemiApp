import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../models/tendencias.dart';

class TendenciasChart extends StatelessWidget {
  final List<Tendencia> data;

  TendenciasChart({required this.data});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(
          leftTitles: SideTitles(showTitles: true),
          bottomTitles: SideTitles(showTitles: true),
        ),
        borderData: FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: data.map((e) => FlSpot(double.parse(e.date.split('-')[0]), e.casosPositivos.toDouble())).toList(),
            isCurved: true,
            colors: [Colors.blue],
            barWidth: 4,
            belowBarData: BarAreaData(show: false),
          ),
          LineChartBarData(
            spots: data.map((e) => FlSpot(double.parse(e.date.split('-')[0]), e.casosSospechosos.toDouble())).toList(),
            isCurved: true,
            colors: [Colors.red],
            barWidth: 4,
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}
