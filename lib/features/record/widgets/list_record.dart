import 'package:cold_flu_tracker_app/features/record/dao/record.dart';
import 'package:cold_flu_tracker_app/features/symptoms/widgets/list_symptom.dart';
import 'package:flutter/material.dart';

class RecordListElement extends StatelessWidget {
  final Record record;

  const RecordListElement({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: record.symptoms.map((element) {
        return SymptomListElement(symptom: element);
      }).toList(),
    );
  }
}