import 'package:cold_flu_tracker_app/features/infection/dao/infection.dart';
import 'package:cold_flu_tracker_app/features/record/widgets/list_record.dart';
import 'package:flutter/material.dart';

class InfectionListElement extends StatelessWidget {
  final Infection infection;

  const InfectionListElement({super.key, required this.infection});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(infection.id),
          ],
        ),
        Row(
          children: [
            Text(infection.startOfInfection.toIso8601String()),
            const Text(" To "),
            Text(infection.endOfInfection.toIso8601String())
          ],
        ),
        ...infection.records
            .map((record) => RecordListElement(
                  record: record,
                ))
            .toList()
      ],
    );
  }
}
