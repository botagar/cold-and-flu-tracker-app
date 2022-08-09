import 'package:cold_flu_tracker_app/common/datetime/datetime_display.dart';
import 'package:cold_flu_tracker_app/features/infection/dao/infection.dart';
import 'package:cold_flu_tracker_app/features/symptoms/widgets/list_symptom.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_timeline/flutter_timeline.dart';

class InfectionTimelineEvents {
  static List<TimelineEventDisplay> generateEvents(
      BuildContext context, Infection infection) {
    var timelineEvents = infection.records
        .map((record) => TimelineEventDisplay(
            indicator: TimelineDots.of(context).icon,
            child: TimelineEventCard(
              // padding: const EdgeInsets.only(
              //     left: 16, top: 12, right: 16, bottom: 0),
              title: DateTimeDisplay(
                dateTime: record.timeOfRecord,
                showDate: true,
                showTime: true,
              ),
              // title: Text('${record.timeOfRecord}'),
              content: Column(
                  children: record.symptoms
                      .map((symptom) => SymptomListElement(symptom: symptom))
                      .toList()),
              // content: const Text('Testing'),
            )))
        .toList();

    return timelineEvents;
  }
}
