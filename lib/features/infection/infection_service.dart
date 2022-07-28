import 'package:cold_flu_tracker_app/features/infection/dao/infection.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class InfectionService {
  Infection getCurrentInfection() {
    var historicalDateThreshhold =
        DateTime.now().subtract(const Duration(days: 3));
    var currentInfection = Hive.box<Infection>("infections")
        .values
        .where((i) => i.endOfInfection.isAfter(historicalDateThreshhold))
        .toList();

    if (currentInfection.isEmpty) {
      return Infection(
        id: const Uuid().v4(),
        startOfInfection: DateTime.now(),
        endOfInfection: DateTime.now(),
      );
    }
    return currentInfection.first;
  }
}
