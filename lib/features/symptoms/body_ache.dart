import 'package:cold_flu_tracker_app/features/symptoms/symptom.dart';
import 'package:flutter/material.dart';

class BodyAcheSymptom extends StatelessWidget {
  const BodyAcheSymptom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Symptom(
      title: "Body Aches",
      defaultExplainerText: "Not experiencing this symptom",
      explainerText: {
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
    );
  }
}
