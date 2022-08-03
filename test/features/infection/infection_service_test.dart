import 'package:clock/clock.dart';
import 'package:cold_flu_tracker_app/features/record/dao/record.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'dart:math';

import 'package:cold_flu_tracker_app/common/persistence/hivedb.dart';
import 'package:cold_flu_tracker_app/features/infection/dao/infection.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cold_flu_tracker_app/features/infection/infection_service.dart';
import 'package:uuid/uuid.dart';

class MockClock extends Mock implements Clock {}

void main() {
  setUpAll(() async {
    await HiveDb.init();
  });

  setUp(() async {
    await HiveDb.clearAllBoxes();
  });

  tearDownAll(() async {
    await HiveDb.close();
  });

  group(
    InfectionService,
    () {
      test('Creates new infection when non exists', () async {
        var infectionService = InfectionService();

        var infection = await infectionService.getCurrentInfection();

        // Is there a way to mock my Infection ORM? I really dont want
        // to wrap my ORM's in a repository class just to test them...
        var currentInfection = Hive.box<Infection>("infections").values;
        expect(currentInfection.toList(), isNotEmpty);
        expect(currentInfection.contains(infection), isTrue);
      });

      test('Adds a new record to current infection', () async {
        var scopedMockClock = MockClock();
        var infectionService = InfectionService(clock: scopedMockClock);
        var timestampNow = DateTime(2022);
        var newRecord =
            Record(id: const Uuid().v4(), timeOfRecord: timestampNow);

        when(() => scopedMockClock.now())
            .thenReturn(timestampNow.subtract(const Duration(seconds: 1)));
        await infectionService.addRecordToCurrentInfection(newRecord);

        var currentInfection = Hive.box<Infection>("infections").values.first;
        expect(currentInfection.records, isNotEmpty);
        expect(currentInfection.records.contains(newRecord), isTrue);
        expect(currentInfection.endOfInfection, timestampNow);
      });

      test('Adds a historical record to current infection', () async {
        var scopedMockClock = MockClock();
        var infectionService = InfectionService(clock: scopedMockClock);
        var timestampNow = DateTime(2022);
        var newRecord =
            Record(id: const Uuid().v4(), timeOfRecord: timestampNow);

        when(() => scopedMockClock.now())
            .thenReturn(timestampNow.add(const Duration(seconds: 1)));
        await infectionService.addRecordToCurrentInfection(newRecord);

        var currentInfection = Hive.box<Infection>("infections").values.first;
        expect(currentInfection.records, isNotEmpty);
        expect(currentInfection.records.contains(newRecord), isTrue);
        expect(currentInfection.endOfInfection.isAfter(timestampNow), isTrue);
      });
    },
  );
}
