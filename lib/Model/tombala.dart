// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'tombala.g.dart';

@JsonSerializable()
class NakliyeTombala {
  int? Id;
  String? UreticiKodu;
  String? UreticiAdiSoyadi;
  String? UreticiIli;
  String? SoforKodu;
  String? Plaka;
  String? Bolge;
  int? Adet;
  String? BirimFiyat;
  String? ToplamFiyat;
  String? Nakliyeci;
  String? Tarih;

  NakliyeTombala(
      {this.Id,
      this.UreticiKodu,
      this.UreticiAdiSoyadi,
      this.UreticiIli,
      this.SoforKodu,
      this.Plaka,
      this.Bolge,
      this.Adet,
      this.BirimFiyat,
      this.ToplamFiyat,
      this.Nakliyeci,
      this.Tarih});

  factory NakliyeTombala.fromJson(Map<String, dynamic> json) {
    return _$NakliyeTombalaFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$NakliyeTombalaToJson(this);
  }
}
