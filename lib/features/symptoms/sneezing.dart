import 'package:cold_flu_tracker_app/features/symptoms/symptom.dart';
import 'package:flutter/material.dart';

class SneezingSymptom extends StatelessWidget {
  const SneezingSymptom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Symptom(
      title: "Sneezing",
      defaultExplainerText: "Not experiencing this symptom",
      explainerText: {
        0: "Not experiencing this symptom",
        1: "Only slight nasal discharge",
        2: "2",
        3: "3",
        4: "4",
        5: "5",
        6: "6",
        7: "7",
        8: "8",
        9: "9",
        10: "Sinuses are constantly running",
      },
    );
  }
}
