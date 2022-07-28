import 'package:cold_flu_tracker_app/features/infection/dao/infection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class InfectionListElement extends StatefulWidget {
  final Infection infection;

  const InfectionListElement({super.key, required this.infection});

  @override
  State<InfectionListElement> createState() => _InfectionListElementState();
}

class _InfectionListElementState extends State<InfectionListElement> {
  @override
  Widget build(BuildContext context) {
    // var infectionStartText = widget.infection.startOfInfection.toLocal();
    // var records = widget.infection.records;
    // records.map((e) => ,)

    return Row(
      children: [
        // Text('Infection starting at $infectionStartText'),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BarChart(
              BarChartData(
                barGroups: <BarChartGroupData>[
                  BarChartGroupData(
                    x: 0,
                    barRods: [
                      BarChartRodData(
                          toY: 6,
                          color: Colors.yellow,
                          width: 10,
                          backDrawRodData:
                              BackgroundBarChartRodData(toY: 10, show: true)),
                    ],
                  ),
                ],
              ),
              swapAnimationDuration: const Duration(milliseconds: 150),
              swapAnimationCurve: Curves.linear,
            ),
          ),
        ),
      ],
    );
  }
}
