import 'package:cold_flu_tracker_app/features/symptoms/widgets/symptom.dart';
import 'package:cold_flu_tracker_app/features/symptoms/dao/symptom.dart' as dao;
import 'package:flutter/material.dart';

class CoughingSymptom extends StatelessWidget {
  final void Function(dao.Symptom symptom)? onSymptomUpdated;

  const CoughingSymptom({Key? key, this.onSymptomUpdated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Symptom(
      title: "Coughing",
      defaultExplainerText: "Not experiencing this symptom.",
      explainerText: const {
        0: "Not experiencing this symptom.",
        1: "Only light tickle in chest. Not coughing yet.",
        2: "Light tickle in chest occationally leading to small cough.",
        3: "Light regular cough.",
        4: "Occational coughing fits. Slightly out of breath after fits.",
        5: "Regular coughing fits. Slightly out of breath after fits. Falling asleep disrupted.",
        6: "6",
        7: "7",
        8: "Serveral uncomfortable coughing fits per hour. Out of breath immediately after fits.",
        9: "9",
        10: "Constant painful coughing. Struggling to breath. Light headed after coughing. Sleep is distrupted.",
      },
      onSymptomUpdate: onSymptomUpdated,
    );
  }
}
