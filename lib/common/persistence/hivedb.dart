import 'package:cold_flu_tracker_app/features/infection/dao/infection.dart';
import 'package:cold_flu_tracker_app/features/record/dao/record.dart';
import 'package:cold_flu_tracker_app/features/symptoms/dao/symptom.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDb {
  static late Box<Record> records;
  static late Box<Infection> infections;

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(RecordAdapter());
    Hive.registerAdapter(SymptomAdapter());
    Hive.registerAdapter(InfectionAdapter());
    records = await Hive.openBox<Record>('records');
    infections = await Hive.openBox<Infection>('infections');
  }

  static clearAllBoxes() async {
    await records.clear();
    await infections.clear();
  }

  static close() async {
    await Hive.close();
  }
}
