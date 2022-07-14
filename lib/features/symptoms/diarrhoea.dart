import 'package:cold_flu_tracker_app/features/symptoms/symptom.dart';
import 'package:flutter/material.dart';

class DiarrhoeaSymptom extends StatelessWidget {
  const DiarrhoeaSymptom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Symptom(
      title: "Diarrhoea",
      defaultExplainerText: "Not experiencing this symptom",
      explainerText: {
        0: "Not experiencing this symptom.",
        1: "Slight bowel discomfort. Stools are softer than usual.",
        2: "2",
        3: "3",
        4: "4",
        5: "5",
        6: "6",
        7: "7",
        8: "8",
        9: "9",
        10: "Constant and debilitating diarrhoea.",
      },
    );
  }
}
