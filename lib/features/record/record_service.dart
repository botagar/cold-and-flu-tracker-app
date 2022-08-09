import 'package:cold_flu_tracker_app/features/infection/infection_service.dart';
import 'package:cold_flu_tracker_app/features/record/dao/record.dart';

class RecordService {
  InfectionService infectionService = InfectionService();

  RecordService({InfectionService? infectionService}) {
    if (infectionService != null) {
      this.infectionService = infectionService;
    }
  }

  void saveRecord(Record recordToSave) async {
    await infectionService.addRecordToCurrentInfection(recordToSave);
  }

  Future<List<Record>> getAllRecordsForInfection(
      {required String infectionId}) async {
    // var recordsBox = await records;
    // return recordsBox.values.where(((record) => true)).toList().cast<Record>();
    return Future.value(List.empty());
  }
}
