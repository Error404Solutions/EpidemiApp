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
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) => Text('${value.toInt()}', style: TextStyle(color: Colors.white70, fontSize: 12)),
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                return index >= 0 && index < data.length
                  ? Text(data[index].mes.substring(0, 3), style: TextStyle(color: Colors.white70, fontSize: 12))
                  : Text('');
              },
            ),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          _buildLineData(Colors.green, 'A. Potenciales'),
          _buildLineData(Colors.red, 'B. Gubernamental'),
        ],
        minX: 0,
        maxX: (data.length - 1).toDouble(),
        minY: 0,
        maxY: data.map((e) => max(e.casosPositivos, e.casosSospechosos)).reduce(max).toDouble() + 2,
      ),
    );
  }

  LineChartBarData _buildLineData(Color color, String tipo) {
    final spots = <FlSpot>[];
    for (int i = 0; i < data.length; i++) {
      if (data[i].tipo == tipo) {
        spots.add(FlSpot(i.toDouble(), data[i].casosPositivos.toDouble()));
      }
    }
    return LineChartBarData(
      spots: spots,
      isCurved: true,
      color: color,  // Cambiado de colors: [color] a color: color
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
    );
  }
}

int max(int a, int b) => a > b ? a : b;