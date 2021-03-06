import 'package:cold_flu_tracker_app/features/calendar/calendar.dart';
import 'package:flutter/material.dart';

import '../common/bottom_nav_bar/bottom_nav_bar.dart';
import '../features/record/record_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var recordService = RecordService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/addRecord'),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: Column(children: const [Calendar()]),
      bottomNavigationBar: BottomNavBar.build(context),
    );
  }
}
