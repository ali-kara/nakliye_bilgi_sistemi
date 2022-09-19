// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plaka.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlakaAdapter extends TypeAdapter<Plaka> {
  @override
  final int typeId = 2;

  @override
  Plaka read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Plaka()
      ..PlakaId = fields[0] as int?
      ..PlakaAdi = fields[1] as String?
      ..Aciklama = fields[2] as String?;
  }

  @override
  void write(BinaryWriter writer, Plaka obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.PlakaId)
      ..writeByte(1)
      ..write(obj.PlakaAdi)
      ..writeByte(2)
      ..write(obj.Aciklama);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlakaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plaka _$PlakaFromJson(Map<String, dynamic> json) => Plaka()
  ..PlakaId = json['PlakaId'] as int?
  ..PlakaAdi = json['Plaka'] as String?
  ..Aciklama = json['Aciklama'] as String?;

Map<String, dynamic> _$PlakaToJson(Plaka instance) => <String, dynamic>{
      'PlakaId': instance.PlakaId,
      'Plaka': instance.PlakaAdi,
      'Aciklama': instance.Aciklama,
    };
