import 'package:clock/clock.dart';
import 'package:cold_flu_tracker_app/features/infection/dao/infection.dart';
import 'package:cold_flu_tracker_app/features/record/dao/record.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class InfectionService {
  late Future<Box<Infection>> infectionRepository;
  Clock clock;

  InfectionService({this.clock = const Clock()}) {
    infectionRepository = Hive.openBox<Infection>('infections');
  }

  Future<Infection> getCurrentInfection() async {
    var infections = await infectionRepository;
    var historicalDateThreshhold =
        clock.now().subtract(const Duration(days: 3));
    var currentInfection = infections.values
        .where((i) => i.endOfInfection.isAfter(historicalDateThreshhold))
        .toList();

    if (currentInfection.isEmpty) {
      var timestampNow = clock.now();
      var newInfection = Infection(
        id: const Uuid().v4(),
        startOfInfection: timestampNow,
        endOfInfection: timestampNow,
      );
      await infections.add(newInfection);
      return newInfection;
    }
    return currentInfection.first;
  }

  Future<void> addRecordToCurrentInfection(Record recordToSave) async {
    var currentInfection = await getCurrentInfection();
    currentInfection.records = <Record>[
      ...currentInfection.records,
      recordToSave
    ];
    if (recordToSave.timeOfRecord.isAfter(currentInfection.endOfInfection)) {
      currentInfection.endOfInfection = recordToSave.timeOfRecord;
    }
    currentInfection.save();
  }
}
