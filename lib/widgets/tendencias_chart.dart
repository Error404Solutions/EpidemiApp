import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../models/tendencias.dart';

class TendenciasChart extends StatelessWidget {
  final List<Tendencia> data;
  final String chartType;

  TendenciasChart({required this.data, required this.chartType});

  @override
  Widget build(BuildContext context) {
    print('Datos en TendenciasChart: $data');
    switch (chartType) {
      case 'Line':
        return _buildLineChart();
      case 'Bar':
        return _buildBarChart();
      case 'Pie':
        return _buildPieChart();
      case 'Polar':
        return _buildPolarChart();
      default:
        return _buildLineChart();
    }
  }

  Widget _buildLineChart() {
    if (data.isEmpty) {
      return Container(
        child: Center(
          child: Text(
            'No hay datos para la gráfica de línea',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) => Text(
                '${value.toInt()}',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                return index >= 0 && index < data.length
                    ? Text(data[index].mes.substring(0, 3),
                        style: TextStyle(color: Colors.white70, fontSize: 12))
                    : Text('');
              },
            ),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          _buildLineData(data, Colors.red, 'Casos Positivos'),
          _buildLineData(data, Colors.yellow, 'Casos Potenciales'),
        ],
        minX: 0,
        maxX: (data.length - 1).toDouble(),
        minY: 0,
        maxY: data.map((e) => max(e.casosPositivos, e.casosSospechosos)).reduce(max).toDouble() + 2,
      ),
    );
  }

  Widget _buildBarChart() {
    return BarChart(
      BarChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) => Text(
                '${value.toInt()}',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                return index >= 0 && index < data.length / 2
                    ? Text(data[index * 2].mes.substring(0, 3), style: TextStyle(color: Colors.white70, fontSize: 12))
                    : Text('');
              },
            ),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        barGroups: List.generate(data.length ~/ 2, (i) {
          final t = data[i * 2];
          final t2 = data[i * 2 + 1];
          return BarChartGroupData(
            x: i,
            barRods: [
              BarChartRodData(
                toY: t.casosPositivos.toDouble(),
                color: Colors.red,
                width: 10,
              ),
              BarChartRodData(
                toY: t2.casosSospechosos.toDouble(),
                color: Colors.yellow,
                width: 10,
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildPieChart() {
    return PieChart(
      PieChartData(
        sections: data.map((t) {
          return PieChartSectionData(
            value: t.tipo == 'Casos Positivos' ? t.casosPositivos.toDouble() : t.casosSospechosos.toDouble(),
            title: '${t.mes.substring(0, 3)}\n${t.tipo == 'Casos Positivos' ? 'Positivos' : 'Sospechosos'}: ${t.tipo == 'Casos Positivos' ? t.casosPositivos : t.casosSospechosos}',
            color: t.tipo == 'Casos Potenciales' ? Colors.yellow : Colors.red,
          );
        }).toList(),
        borderData: FlBorderData(show: false),
        sectionsSpace: 2,
      ),
    );
  }


  Widget _buildPolarChart() {
    List<Tendencia> sortedData = List.from(data)..sort((a, b) => a.mes.compareTo(b.mes));
    final totalPositivos = sortedData.map((e) => e.casosPositivos).reduce((a, b) => a + b);
    final totalSospechosos = sortedData.map((e) => e.casosSospechosos).reduce((a, b) => a + b);

    return AspectRatio(
      aspectRatio: 4,
      child: PieChart(
        PieChartData(
          centerSpaceRadius: 1, // Ajuste del radio del centro
          sections: [
            PieChartSectionData(
              value: totalPositivos.toDouble(),
              title: 'Positivos\n$totalPositivos',
              color: Colors.red,
            ),
            PieChartSectionData(
              value: totalSospechosos.toDouble(),
              title: 'Sospechosos\n$totalSospechosos',
              color: Colors.yellow,
            ),
          ],
          borderData: FlBorderData(show: false),
          sectionsSpace: 5,
        ),
        swapAnimationDuration: Duration(milliseconds: 150),
        swapAnimationCurve: Curves.linear,
      ),
    );
  }


  LineChartBarData _buildLineData(List<Tendencia> data, Color color, String tipo) {
  final spots = <FlSpot>[];
  for (int i = 0; i < data.length; i++) {
    if (data[i].tipo == tipo) {
      double yValue = tipo == 'Casos Positivos' 
          ? data[i].casosPositivos.toDouble() 
          : data[i].casosSospechosos.toDouble();
      spots.add(FlSpot(i.toDouble(), yValue));
    }
  }
  return LineChartBarData(
    spots: spots,
    isCurved: true,
    color: color,
    barWidth: 4,
    isStrokeCapRound: true,
    dotData: FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
  );
}

  int max(int a, int b) => a > b ? a : b;
}
