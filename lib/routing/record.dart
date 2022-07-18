import 'package:cold_flu_tracker_app/features/record/record_service.dart';
import 'package:cold_flu_tracker_app/features/record/record.dart' as dao;
import 'package:cold_flu_tracker_app/features/symptoms/dao/symptom.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';

import '../common/bottom_nav_bar/bottom_nav_bar.dart';
import '../features/symptoms/widgets/body_ache.dart';
import '../features/symptoms/widgets/chills.dart';
import '../features/symptoms/widgets/coughing.dart';
import '../features/symptoms/widgets/diarrhoea.dart';
import '../features/symptoms/widgets/fever.dart';
import '../features/symptoms/widgets/headache.dart';
import '../features/symptoms/widgets/runny_nose.dart';
import '../features/symptoms/widgets/sneezing.dart';
import '../features/symptoms/widgets/sore_throat.dart';
import '../features/symptoms/widgets/vomiting.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({Key? key}) : super(key: key);

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  var recordService = RecordService();
  var symptoms = <String, Symptom>{};
  var record = dao.Record(id: const Uuid().v4(), timeOfRecord: DateTime.now());

  @override
  Widget build(BuildContext context) {
    void updateState(Symptom symptom) => {
          if (symptom.rating == 0)
            {symptoms.remove(symptom.name)}
          else
            {symptoms[symptom.name] = symptom},
          print(symptoms)
        };

    void saveState() => {
          print("Saving state"),
          record = dao.Record(
            id: const Uuid().v4(),
            timeOfRecord: DateTime.now(),
            symptoms: symptoms.values.toList(),
          ),
          recordService.saveRecord(record),
          Fluttertoast.showToast(
              msg: "Record Saved",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 24.0),
          Navigator.popUntil(context, ModalRoute.withName('/')),
        };

    var symptomWidgets = <Widget>[
      RunnyNoseSymptom(onSymptomUpdated: updateState),
      SneezingSymptom(onSymptomUpdated: updateState),
      CoughingSymptom(onSymptomUpdated: updateState),
      SoreThroatSymptom(onSymptomUpdated: updateState),
      FeverSymptom(onSymptomUpdated: updateState),
      ChillsSymptom(onSymptomUpdated: updateState),
      HeadacheSymptom(onSymptomUpdated: updateState),
      BodyAcheSymptom(onSymptomUpdated: updateState),
      VomitingSymptom(onSymptomUpdated: updateState),
      DiarrhoeaSymptom(onSymptomUpdated: updateState),
      TextButton(
          onPressed: saveState,
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.all(16.0)),
          ),
          child:
              Text('Save', style: Theme.of(context).textTheme.headlineMedium))
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Symptoms Record"),
        ),
        bottomNavigationBar: BottomNavBar.build(context),
        body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: symptomWidgets.length,
          itemBuilder: (BuildContext context, int index) {
            return symptomWidgets[index];
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(
            thickness: 4,
          ),
        ));
  }
}
