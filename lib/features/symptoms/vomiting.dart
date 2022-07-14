import 'package:cold_flu_tracker_app/features/symptoms/symptom.dart';
import 'package:flutter/material.dart';

class VomitingSymptom extends StatelessWidget {
  const VomitingSymptom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Symptom(
      title: "Vomiting",
      defaultExplainerText: "Not experiencing this symptom",
      explainerText: {
        0: "Not experiencing this symptom",
        1: "Slight discomfort in stomache which may lead to vomiting.",
        2: "2",
        3: "3",
        4: "4",
        5: "5",
        6: "6",
        7: "7",
        8: "8",
        9: "9",
        10: "Constant vomiting. Cannot keep food or fluids down. Expelling Bile.",
      },
    );
  }
}
