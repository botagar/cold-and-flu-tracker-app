import 'package:cold_flu_tracker_app/features/record/dao/record.dart';
import 'package:hive_flutter/adapters.dart';

part 'infection.g.dart';

@HiveType(typeId: 2)
class Infection extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  DateTime startOfInfection;

  @HiveField(2)
  DateTime endOfInfection;

  @HiveField(3)
  List<Record> records;

  Infection({
    required this.id,
    required this.startOfInfection,
    required this.endOfInfection,
    this.records = const [],
  });

  @override
  String toString() {
    return '{id: $id, startOfInfection: $startOfInfection, endOfInfection: $endOfInfection, records: $records}';
  }
}
