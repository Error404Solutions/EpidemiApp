import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../models/tendencias.dart';

class TendenciasChart extends StatelessWidget {
  final List<Tendencia> data;
  final String chartType;

  TendenciasChart({required this.data, required this.chartType});

  @override
  Widget build(BuildContext context) {
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
              showTitles: false,
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
          _buildLineData(data, Colors.green, 'A. Potenciales'),
          _buildLineData(data, Colors.red, 'B. Gubernamental'),
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
        barGroups: data.map((t) {
          return BarChartGroupData(
            x: data.indexOf(t),
            barRods: [
              BarChartRodData(
                toY: t.casosPositivos.toDouble(),
                color: t.tipo == 'A. Potenciales' ? Colors.green : Colors.red,
                width: 20,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPieChart() {
    return PieChart(
      PieChartData(
        sections: data.map((t) {
          return PieChartSectionData(
            value: t.casosPositivos.toDouble(),
            title: t.mes.substring(0, 3),
            color: t.tipo == 'A. Potenciales' ? Colors.green : Colors.red,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPolarChart() {
    List<Tendencia> sortedData = List.from(data)..sort((a, b) => _monthOrder(a.mes).compareTo(_monthOrder(b.mes)));
    final totalPositivos = sortedData.map((e) => e.casosPositivos).reduce((a, b) => a + b);

    return AspectRatio(
      aspectRatio: 1.3,
      child: PieChart(
        PieChartData(
          centerSpaceRadius: 0,
          sections: sortedData.map((t) {
            final percent = t.casosPositivos / totalPositivos;
            return PieChartSectionData(
              value: t.casosPositivos.toDouble(),
              title: '${t.mes.substring(0, 3)}\n${t.casosPositivos}',
              color: t.tipo == 'A. Potenciales' ? Colors.green : Colors.red,
              radius: 80 + (50 * percent),
              titleStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [Shadow(color: Colors.black, blurRadius: 2)],
              ),
            );
          }).toList(),
          borderData: FlBorderData(show: false),
          sectionsSpace: 2,
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
        spots.add(FlSpot(i.toDouble(), data[i].casosPositivos.toDouble()));
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

  int _monthOrder(String month) {
    final months = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
    return months.indexOf(month);
  }

  int max(int a, int b) => a > b ? a : b;
}