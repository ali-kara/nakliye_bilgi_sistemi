// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'tombala.g.dart';

@JsonSerializable()
class NakliyeTombala {
  int? id;
  String? ureticiKodu;
  String? ureticiAdiSoyadi;
  String? ureticiIli;
  String? soforKodu;
  String? plaka;
  String? bolge;
  int? adet;
  String? birimFiyat;
  String? toplamFiyat;
  String? nakliyeci;
  String? tarih;

  NakliyeTombala(
      {this.id,
      this.ureticiKodu,
      this.ureticiAdiSoyadi,
      this.ureticiIli,
      this.soforKodu,
      this.plaka,
      this.bolge,
      this.adet,
      this.birimFiyat,
      this.toplamFiyat,
      this.nakliyeci,
      this.tarih});

  factory NakliyeTombala.fromJson(Map<String, dynamic> json) {
    return _$NakliyeTombalaFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$NakliyeTombalaToJson(this);
  }
}
