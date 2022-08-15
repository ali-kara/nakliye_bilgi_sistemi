// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tombala.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NakliyeTombala _$NakliyeTombalaFromJson(Map<String, dynamic> json) =>
    NakliyeTombala(
      Id: json['Id'] as int?,
      UreticiKodu: json['UreticiKodu'] as String?,
      UreticiAdiSoyadi: json['UreticiAdiSoyadi'] as String?,
      UreticiIli: json['UreticiIli'] as String?,
      SoforKodu: json['SoforKodu'] as String?,
      Plaka: json['Plaka'] as String?,
      Bolge: json['Bolge'] as String?,
      Adet: json['Adet'] as int?,
      BirimFiyat: json['BirimFiyat'] as String?,
      ToplamFiyat: json['ToplamFiyat'] as String?,
      Nakliyeci: json['Nakliyeci'] as String?,
      Tarih: json['Tarih'] as String?,
    );

Map<String, dynamic> _$NakliyeTombalaToJson(NakliyeTombala instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'UreticiKodu': instance.UreticiKodu,
      'UreticiAdiSoyadi': instance.UreticiAdiSoyadi,
      'UreticiIli': instance.UreticiIli,
      'SoforKodu': instance.SoforKodu,
      'Plaka': instance.Plaka,
      'Bolge': instance.Bolge,
      'Adet': instance.Adet,
      'BirimFiyat': instance.BirimFiyat,
      'ToplamFiyat': instance.ToplamFiyat,
      'Nakliyeci': instance.Nakliyeci,
      'Tarih': instance.Tarih,
    };
