import 'package:cold_flu_tracker_app/features/symptoms/dao/symptom.dart';
import 'package:flutter/material.dart';

class SymptomListElement extends StatelessWidget {
  final Symptom symptom;
  final bool showExplainer = true;

  const SymptomListElement({super.key, required this.symptom});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, bottom: 10),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                  child: Text("${symptom.name}: ${symptom.rating}",
                      style: Theme.of(context).textTheme.bodyMedium)),
            ],
          ),
          if (showExplainer)
            Row(
              children: [
                Flexible(
                    child: Text(symptom.explainerText,
                        style: Theme.of(context).textTheme.bodySmall))
              ],
            )
        ],
      ),
    );
  }
}
