// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bolge.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BolgeAdapter extends TypeAdapter<Bolge> {
  @override
  final int typeId = 3;

  @override
  Bolge read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Bolge(
      bolgeId: fields[0] as dynamic,
      bolgeAdi: fields[1] as dynamic,
      aciklama: fields[2] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Bolge obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.bolgeId)
      ..writeByte(1)
      ..write(obj.bolgeAdi)
      ..writeByte(2)
      ..write(obj.aciklama);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BolgeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
