import 'package:cold_flu_tracker_app/routing/profile.dart';
import 'package:cold_flu_tracker_app/routing/record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/record/record.dart';
import 'features/symptoms/dao/symptom.dart';
import 'routing/home.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(RecordAdapter());
  Hive.registerAdapter(SymptomAdapter());

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
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
