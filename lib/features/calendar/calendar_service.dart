import 'package:cold_flu_tracker_app/features/record/record.dart';
import 'package:cold_flu_tracker_app/features/symptoms/dao/symptom.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CalendarService {
  double getSicknessRatingForDay(DateTime day) {
    var recordsFromDay = Hive.box<Record>('records')
        .values
        .where((r) => r.timeOfRecord.day == day.day)
        .toList();

    if (recordsFromDay.isEmpty) return 0.0;

    var normalisedAverage = recordsFromDay.fold(
            0.0,
            (acc, r) =>
                (acc! as double) +
                _calculateNormalisedScoreForSymptoms(r.symptoms)) /
        recordsFromDay.length;

    debugPrint("Normalised Average for ${day.toLocal()} is $normalisedAverage");

    return normalisedAverage;
  }

  double _calculateNormalisedScoreForSymptoms(List<Symptom> symptoms) {
    if (symptoms.isEmpty) return 0.0;

    var normalisedScore = symptoms.fold(
            0.0,
            (accumilator, symptom) =>
                (accumilator as double) + (symptom.rating / 10)) /
        symptoms.length;

    return normalisedScore;
  }
}
