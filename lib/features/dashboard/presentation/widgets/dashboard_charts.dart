// charts.dart
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashboardCharts extends StatelessWidget {
  const DashboardCharts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const SizedBox(height: 10),
        // Card(
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(10),
        //   ),
        //   child: Container(
        //     padding: const EdgeInsets.all(10),
        //     height: 200,
        //     child: BarChart(
        //       BarChartData(
        //         barGroups: _getBarGroups(),
        //         borderData: FlBorderData(show: false),
        //         titlesData: FlTitlesData(
        //           leftTitles:
        //               AxisTitles(sideTitles: SideTitles(showTitles: true)),
        //           bottomTitles: AxisTitles(
        //             sideTitles: SideTitles(
        //               showTitles: true,
        //               getTitlesWidget: (value, meta) {
        //                 switch (value.toInt()) {
        //                   case 0:
        //                     return Text('Mon');
        //                   case 1:
        //                     return Text('Tue');
        //                   case 2:
        //                     return Text('Wed');
        //                   case 3:
        //                     return Text('Thu');
        //                   case 4:
        //                     return Text('Fri');
        //                   default:
        //                     return Text('');
        //                 }
        //               },
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        // const SizedBox(height: 10),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 200,
            child: LineChart(
              LineChartData(
                lineBarsData: _getLineBarsData(),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: true)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        switch (value.toInt()) {
                          case 0:
                            return const Text('Jan');
                          case 1:
                            return const Text('Feb');
                          case 2:
                            return const Text('Mar');
                          case 3:
                            return const Text('Apr');
                          case 4:
                            return const Text('May');
                          default:
                            return const Text('');
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> _getBarGroups() {
    return [
      BarChartGroupData(
          x: 0, barRods: [BarChartRodData(toY: 8, color: Colors.blue)]),
      BarChartGroupData(
          x: 1, barRods: [BarChartRodData(toY: 10, color: Colors.blue)]),
      BarChartGroupData(
          x: 2, barRods: [BarChartRodData(toY: 14, color: Colors.blue)]),
      BarChartGroupData(
          x: 3, barRods: [BarChartRodData(toY: 15, color: Colors.blue)]),
      BarChartGroupData(
          x: 4, barRods: [BarChartRodData(toY: 13, color: Colors.blue)]),
    ];
  }

  List<LineChartBarData> _getLineBarsData() {
    return [
      LineChartBarData(
        spots: [
          const FlSpot(0, 1),
          const FlSpot(1, 1.5),
          const FlSpot(2, 1.4),
          const FlSpot(3, 3.4),
          const FlSpot(4, 2),
        ],
        isCurved: true,
        color: Colors.green,
        barWidth: 4,
        dotData: const FlDotData(show: false),
      ),
    ];
  }
}
