// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infection.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InfectionAdapter extends TypeAdapter<Infection> {
  @override
  final int typeId = 2;

  @override
  Infection read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Infection(
      id: fields[0] as String,
      startOfInfection: fields[1] as DateTime,
      endOfInfection: fields[2] as DateTime,
      records: (fields[3] as List).cast<Infection>(),
    );
  }

  @override
  void write(BinaryWriter writer, Infection obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.startOfInfection)
      ..writeByte(2)
      ..write(obj.endOfInfection)
      ..writeByte(3)
      ..write(obj.records);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InfectionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
