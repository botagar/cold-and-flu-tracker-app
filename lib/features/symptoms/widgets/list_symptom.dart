import 'package:cold_flu_tracker_app/features/symptoms/dao/symptom.dart';
import 'package:flutter/material.dart';

class SymptomListElement extends StatelessWidget {
  final Symptom symptom;

  const SymptomListElement({super.key, required this.symptom});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [Text(symptom.name), Text(symptom.rating.toString())],
        ),
        Row(
          children: [Flexible(child: Text(symptom.explainerText))],
        )
      ],
    );
  }
}
