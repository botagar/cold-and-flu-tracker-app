import 'package:cold_flu_tracker_app/features/symptoms/widgets/symptom.dart';
import 'package:cold_flu_tracker_app/features/symptoms/dao/symptom.dart' as dao;
import 'package:flutter/material.dart';

class RunnyNoseSymptom extends StatelessWidget {
  final void Function(dao.Symptom symptom)? onSymptomUpdated;

  const RunnyNoseSymptom({Key? key, this.onSymptomUpdated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Symptom(
      title: "Runny Nose",
      defaultExplainerText: "Not experiencing this symptom",
      explainerText: const {
        0: "Not experiencing this symptom.",
        1: "Only slight nasal discharge.",
        2: "2",
        3: "3",
        4: "4",
        5: "5",
        6: "6",
        7: "7",
        8: "8",
        9: "9",
        10: "Sinuses are constantly running.",
      },
      onSymptomUpdate: onSymptomUpdated,
    );
  }
}
