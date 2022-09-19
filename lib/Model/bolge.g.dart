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
    return Bolge()
      ..BolgeId = fields[0] as int?
      ..BolgeAdi = fields[1] as String?
      ..Aciklama = fields[2] as String?;
  }

  @override
  void write(BinaryWriter writer, Bolge obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.BolgeId)
      ..writeByte(1)
      ..write(obj.BolgeAdi)
      ..writeByte(2)
      ..write(obj.Aciklama);
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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bolge _$BolgeFromJson(Map<String, dynamic> json) => Bolge()
  ..BolgeId = json['BolgeId'] as int?
  ..BolgeAdi = json['BolgeAdi'] as String?
  ..Aciklama = json['Aciklama'] as String?;

Map<String, dynamic> _$BolgeToJson(Bolge instance) => <String, dynamic>{
      'BolgeId': instance.BolgeId,
      'BolgeAdi': instance.BolgeAdi,
      'Aciklama': instance.Aciklama,
    };
