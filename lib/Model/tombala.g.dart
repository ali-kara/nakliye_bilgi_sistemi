// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tombala.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NakliyeTombala _$NakliyeTombalaFromJson(Map<String, dynamic> json) =>
    NakliyeTombala(
      id: json['id'] as int?,
      ureticiKodu: json['ureticiKodu'] as String?,
      ureticiAdiSoyadi: json['ureticiAdiSoyadi'] as String?,
      ureticiIli: json['ureticiIli'] as String?,
      soforKodu: json['soforKodu'] as String?,
      plaka: json['plaka'] as String?,
      bolge: json['bolge'] as String?,
      adet: json['adet'] as int?,
      birimFiyat: json['birimFiyat'] as String?,
      toplamFiyat: json['toplamFiyat'] as String?,
      nakliyeci: json['nakliyeci'] as String?,
      tarih: json['tarih'] as String?,
    );

Map<String, dynamic> _$NakliyeTombalaToJson(NakliyeTombala instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ureticiKodu': instance.ureticiKodu,
      'ureticiAdiSoyadi': instance.ureticiAdiSoyadi,
      'ureticiIli': instance.ureticiIli,
      'soforKodu': instance.soforKodu,
      'plaka': instance.plaka,
      'bolge': instance.bolge,
      'adet': instance.adet,
      'birimFiyat': instance.birimFiyat,
      'toplamFiyat': instance.toplamFiyat,
      'nakliyeci': instance.nakliyeci,
      'tarih': instance.tarih,
    };
