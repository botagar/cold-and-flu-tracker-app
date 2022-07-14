import 'package:cold_flu_tracker_app/routing/profile.dart';
import 'package:cold_flu_tracker_app/routing/record.dart';
import 'package:flutter/material.dart';

import 'routing/home.dart';

void main() {
  runApp(const ColdAndFluTrackingApp());
}

class ColdAndFluTrackingApp extends StatelessWidget {
  const ColdAndFluTrackingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cold and Flu Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      locale: const Locale('en', 'AU'),
      home: const HomePage(title: 'Cold and Flu Tracker'),
      routes: {
        '/addRecord': (context) => const RecordPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
