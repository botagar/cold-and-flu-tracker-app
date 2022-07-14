import 'package:flutter/material.dart';

import '../common/bottom_nav_bar/bottom_nav_bar.dart';
import '../features/symptoms/body_ache.dart';
import '../features/symptoms/chills.dart';
import '../features/symptoms/coughing.dart';
import '../features/symptoms/diarrhoea.dart';
import '../features/symptoms/fever.dart';
import '../features/symptoms/headache.dart';
import '../features/symptoms/runny_nose.dart';
import '../features/symptoms/sneezing.dart';
import '../features/symptoms/sore_throat.dart';
import '../features/symptoms/vomiting.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({Key? key}) : super(key: key);

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  var symptoms = <Widget>[
    const RunnyNoseSymptom(),
    const SneezingSymptom(),
    const CoughingSymptom(),
    const SoreThroatSymptom(),
    const FeverSymptom(),
    const ChillsSymptom(),
    const HeadacheSymptom(),
    const BodyAcheSymptom(),
    const VomitingSymptom(),
    const DiarrhoeaSymptom(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Symptoms Record"),
        ),
        bottomNavigationBar: BottomNavBar.build(context),
        body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: symptoms.length,
          itemBuilder: (BuildContext context, int index) {
            return symptoms[index];
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(
            thickness: 4,
          ),
        ));
  }
}
