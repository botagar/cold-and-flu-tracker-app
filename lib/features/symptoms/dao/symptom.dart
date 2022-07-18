import 'package:hive_flutter/adapters.dart';

part 'symptom.g.dart';

@HiveType(typeId: 1)
class Symptom extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final int rating;

  @HiveField(3)
  final String explainerText;

  @HiveField(4)
  final DateTime dateOfSymptom;

  Symptom(
      {required this.name,
      required this.rating,
      required this.explainerText,
      required this.dateOfSymptom,
      required this.id});

  @override
  String toString() {
    return '{id: $id, name: $name, rating: $rating, dateOfSystem: $dateOfSymptom, explainerText: $explainerText}';
  }
}
