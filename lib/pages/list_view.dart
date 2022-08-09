import 'package:cold_flu_tracker_app/common/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:cold_flu_tracker_app/features/infection/dao/infection.dart';
import 'package:cold_flu_tracker_app/features/infection/infection_list_element.dart';
import 'package:cold_flu_tracker_app/features/infection/infection_service.dart';
import 'package:cold_flu_tracker_app/features/infection/infection_timeline_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timeline/flutter_timeline.dart';
import 'package:flutter_timeline/indicator_position.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  var infectionService = InfectionService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Review Records"),
      ),
      bottomNavigationBar: BottomNavBar.build(context),
      body: generateTimelineBody(),
    );
  }

  Widget generateTimelineBody() {
    return FutureBuilder(
      initialData: const Center(
          child: Icon(
        Icons.list_outlined,
        color: Colors.white,
        size: 35,
      )),
      future: infectionService.getCurrentInfection(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            debugPrint('Connection state none loading current infection');
            return const Text('Error loading current infection');
          case ConnectionState.waiting:
          case ConnectionState.active:
            break;
          case ConnectionState.done:
            var currentInfection = snapshot.data as Infection;
            return TimelineTheme(
                data: TimelineThemeData(
                  lineColor: Colors.blueAccent,
                  strokeCap: StrokeCap.round,
                  itemGap: 10,
                  lineGap: 0,
                  gutterSpacing: 0,
                ),
                child: Timeline(
                  anchor: IndicatorPosition.top,
                  indicatorSize: 42,
                  altOffset: const Offset(0, 4),
                  events: InfectionTimelineEvents.generateEvents(
                      context, currentInfection),
                ));
        }
        return const Text('Loading latest infection data');
      },
    );
  }
}
