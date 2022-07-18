import 'package:cold_flu_tracker_app/features/record/record.dart';
import 'package:hive/hive.dart';

class RecordService {
  late Future<Box> records;

  RecordService() {
    records = Hive.openBox<Record>('records');
  }

  void saveRecord(Record recordToSave) async {
    var recordsBox = await records;
    recordsBox.add(recordToSave);
  }

  Future<List<Record>> getAllRecords() async {
    var recordsBox = await records;
    return recordsBox.values.toList().cast<Record>();
  }
}
