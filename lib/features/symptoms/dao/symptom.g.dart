// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptom.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SymptomAdapter extends TypeAdapter<Symptom> {
  @override
  final int typeId = 1;

  @override
  Symptom read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Symptom(
      name: fields[1] as String,
      rating: fields[2] as int,
      explainerText: fields[3] as String,
      dateOfSymptom: fields[4] as DateTime,
      id: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Symptom obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.rating)
      ..writeByte(3)
      ..write(obj.explainerText)
      ..writeByte(4)
      ..write(obj.dateOfSymptom);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SymptomAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
