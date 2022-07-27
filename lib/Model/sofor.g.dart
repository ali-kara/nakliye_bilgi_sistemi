// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sofor.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SoforAdapter extends TypeAdapter<Sofor> {
  @override
  final int typeId = 1;

  @override
  Sofor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sofor(
      soforID: fields[0] as int?,
      kodu: fields[1] as String?,
      adi: fields[2] as String?,
      soyadi: fields[3] as String?,
      plaka: fields[4] as String?,
      sehir: fields[5] as String?,
      bolge: fields[6] as String?,
      nakliyeci: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Sofor obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.soforID)
      ..writeByte(1)
      ..write(obj.kodu)
      ..writeByte(2)
      ..write(obj.adi)
      ..writeByte(3)
      ..write(obj.soyadi)
      ..writeByte(4)
      ..write(obj.plaka)
      ..writeByte(5)
      ..write(obj.sehir)
      ..writeByte(6)
      ..write(obj.bolge)
      ..writeByte(7)
      ..write(obj.nakliyeci);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SoforAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
