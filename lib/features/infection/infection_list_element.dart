import 'package:cold_flu_tracker_app/common/datetime/datetime_display.dart';
import 'package:cold_flu_tracker_app/features/infection/dao/infection.dart';
// import 'package:cold_flu_tracker_app/features/record/widgets/list_record.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InfectionListElement extends StatelessWidget {
  final Infection infection;

  const InfectionListElement({super.key, required this.infection});

  @override
  Widget build(BuildContext context) {
    String infectionStartDate =
        DateFormat('yyyy/MM/dd').format(infection.startOfInfection);
    String infectionEndDate =
        DateFormat('yyyy/MM/dd').format(infection.endOfInfection);
    return Container(
      padding: const EdgeInsets.only(left: 10, bottom: 10),
      child: Column(
        children: [
          Row(
            children: [
              DateTimeDisplay(
                  dateTime: infection.startOfInfection,
                  showDate: true,
                  showTime: false),
              Flexible(
                  child: Text(
                "$infectionStartDate to $infectionEndDate",
                style: Theme.of(context).textTheme.titleMedium,
              ))
            ],
          ),
          Row(
            children: [
              Text(infection.id.substring(24),
                  style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          // ...infection.records
          //     .map((record) => RecordListElement(
          //           record: record,
          //         ))
          //     .toList()
        ],
      ),
    );
  }
}
