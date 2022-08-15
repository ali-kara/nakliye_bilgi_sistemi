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
    return Plaka(
      plakaId: fields[0] as dynamic,
      plakaAdi: fields[1] as dynamic,
      aciklama: fields[2] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Plaka obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.plakaId)
      ..writeByte(1)
      ..write(obj.plakaAdi)
      ..writeByte(2)
      ..write(obj.aciklama);
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

Plaka _$PlakaFromJson(Map<String, dynamic> json) => Plaka(
      plakaId: json['plakaId'],
      plakaAdi: json['plakaAdi'],
      aciklama: json['aciklama'],
    );

Map<String, dynamic> _$PlakaToJson(Plaka instance) => <String, dynamic>{
      'plakaId': instance.plakaId,
      'plakaAdi': instance.plakaAdi,
      'aciklama': instance.aciklama,
    };
