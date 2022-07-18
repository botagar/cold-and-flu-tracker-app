import 'package:cold_flu_tracker_app/features/symptoms/widgets/symptom.dart';
import 'package:cold_flu_tracker_app/features/symptoms/dao/symptom.dart' as dao;
import 'package:flutter/material.dart';

class BodyAcheSymptom extends StatelessWidget {
  final void Function(dao.Symptom symptom)? onSymptomUpdated;

  const BodyAcheSymptom({Key? key, this.onSymptomUpdated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Symptom(
      title: "Body Aches",
      defaultExplainerText: "Not experiencing this symptom",
      explainerText: const {
        0: "Not experiencing this symptom",
        1: "Slight general discomfort",
        2: "2",
        3: "3",
        4: "4",
        5: "5",
        6: "6",
        7: "7",
        8: "8",
        9: "9",
        10: "Debilitating constant pain.",
      },
      onSymptomUpdate: onSymptomUpdated,
    );
  }
}
