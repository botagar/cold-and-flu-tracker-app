import 'package:cold_flu_tracker_app/common/persistence/hivedb.dart';
import 'package:cold_flu_tracker_app/pages/list_view.dart';
import 'package:cold_flu_tracker_app/pages/profile.dart';
import 'package:cold_flu_tracker_app/pages/record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'pages/home.dart';

Future<void> main() async {
  await HiveDb.init();

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
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: const Locale('en', 'AU'), //Localizations.localeOf(context),
      supportedLocales: const [Locale('en', '')],
      home: const HomePage(title: 'Cold and Flu Tracker'),
      routes: {
        '/addRecord': (context) => const RecordPage(),
        '/listview': (context) => const ListViewPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
