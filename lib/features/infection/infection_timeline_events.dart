import 'package:cold_flu_tracker_app/common/datetime/datetime_display.dart';
import 'package:cold_flu_tracker_app/features/infection/dao/infection.dart';
import 'package:cold_flu_tracker_app/features/symptoms/widgets/list_symptom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timeline/flutter_timeline.dart';

class InfectionTimelineEvents {
  static List<TimelineEventDisplay> generateEvents(
      BuildContext context, Infection infection) {
    var timelineEvents = infection.records
        .map((record) => TimelineEventDisplay(
            indicator: const Icon(Icons.coronavirus_outlined),
            child: TimelineEventCard(
              title: DateTimeDisplay(
                dateTime: record.timeOfRecord,
                foreground: false,
              ),
              content: Column(
                  children: record.symptoms
                      .map((symptom) => SymptomListElement(symptom: symptom))
                      .toList()),
            )))
        .toList();

    return timelineEvents;
  }
}
