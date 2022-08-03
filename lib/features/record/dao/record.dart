import 'package:cold_flu_tracker_app/features/symptoms/dao/symptom.dart';
import 'package:hive_flutter/adapters.dart';

part 'record.g.dart';

@HiveType(typeId: 0)
class Record extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String? associatedInfection;

  @HiveField(2)
  final DateTime timeOfRecord;

  @HiveField(3)
  final List<Symptom> symptoms;

  Record({
    required this.id,
    required this.timeOfRecord,
    this.associatedInfection,
    this.symptoms = const [],
  });

  @override
  String toString() {
    return '{id: $id, associatedInfection: $associatedInfection, timeOfRecord: $timeOfRecord, symptoms: $symptoms}';
  }
}
