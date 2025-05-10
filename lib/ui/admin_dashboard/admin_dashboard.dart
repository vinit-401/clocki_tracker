import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              child: PieChart(
                curve: Curves.easeIn,
                PieChartData(
                  titleSunbeamLayout: false,
                  sections: [
                    PieChartSectionData(
                      color: Colors.blue,
                      value: 12.5,
                    ),
                    PieChartSectionData(color: Colors.pink, value: 12),
                    PieChartSectionData(color: Colors.yellow, value: 25),
                    PieChartSectionData(color: Colors.orange, value: 8),
                    PieChartSectionData(color: Colors.pink, value: 8),
                  ],
                ),
              ),
            ),
            Column(
              spacing: 8,
              children: [
                listData('Absent', Colors.blue),
                listData('Present', Colors.red),
                listData('Leave', Colors.yellow),
                listData('Half Day', Colors.orange),
                listData('Holiday', Colors.pink),
              ],
            ),
            Container(
              height: 150,
              child: PieChart(
                curve: Curves.easeIn,
                PieChartData(
                  titleSunbeamLayout: false,
                  sections: [
                    PieChartSectionData(color: Colors.blue, value: 12),
                    PieChartSectionData(color: Colors.red, value: 25),
                    PieChartSectionData(color: Colors.yellow, value: 8),
                    PieChartSectionData(color: Colors.green, value: 8),
                    PieChartSectionData(color: Colors.purple, value: 8),
                  ],
                ),
              ),
            ),
            Column(
              spacing: 8,
              children: [
                listData('Work', Colors.blue),
                listData('Overtime', Colors.red),
                listData('Lunch', Colors.yellow),
                listData('Break', Colors.green),
                listData('Late', Colors.purple),
              ],
            ),
            Container(
              height: 150,
              padding: EdgeInsets.all(8),
              child: LineChart(
                curve: Curves.bounceIn,
                LineChartData(
                  maxX: 20,
                  maxY: 10,
                  gridData: FlGridData(),
                  titlesData: FlTitlesData(
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  lineTouchData: LineTouchData(
                    handleBuiltInTouches: true,
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipColor: (touchedSpot) =>
                          Colors.blueGrey.withValues(alpha: 0.8),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      curveSmoothness: 0.6,
                      // belowBarData: BarAreaData(color: Colors.orange.shade100,show: true),
                      color: Colors.orange.withValues(alpha: 0.5),
                      barWidth: 4,
                      isStrokeCapRound: true,
                      spots: const [
                        FlSpot(1, 2.8),
                        FlSpot(3, 1.9),
                        FlSpot(6, 3),
                        FlSpot(10, 1.3),
                        FlSpot(13, 2.5),
                      ],
                    ),
                    LineChartBarData(
                      isCurved: true,
                      // belowBarData: BarAreaData(color: Colors.blue.shade100,show: true),
                      curveSmoothness: 0.6,
                      color: Colors.blue.withValues(alpha: 0.5),
                      barWidth: 4,
                      isStrokeCapRound: true,
                      spots: const [
                        FlSpot(1, 1),
                        FlSpot(3, 4),
                        FlSpot(5, 1.8),
                        FlSpot(7, 5),
                        FlSpot(10, 2),
                        FlSpot(12, 2.2),
                        FlSpot(13, 1.8),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  listData(String title, Color colorTile) {
    return SizedBox(
      child: Row(
        spacing: 8,
        children: [
          Container(
            height: 20,
            width: 20,
            color: colorTile,
          ),
          Text(title),
        ],
      ),
    );
  }
}
