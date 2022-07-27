import 'package:hive_flutter/adapters.dart';

import '../Global/Constants/_hive_types.dart';

part 'sofor.g.dart';

@HiveType(typeId: HiveTypes.soforTypeId)
class Sofor {
  @HiveField(0)
  int? soforID;
  @HiveField(1)
  String? kodu;
  @HiveField(2)
  String? adi;
  @HiveField(3)
  String? soyadi;
  @HiveField(4)
  String? plaka;
  @HiveField(5)
  String? sehir;
  @HiveField(6)
  String? bolge;
  @HiveField(7)
  String? nakliyeci;

  Sofor({
    this.soforID,
    this.kodu,
    this.adi,
    this.soyadi,
    this.plaka,
    this.sehir,
    this.bolge,
    this.nakliyeci,
  });

  Sofor.fromJson(Map<String, dynamic> json) {
    soforID = json['SoforID'];
    kodu = json['Kodu'];
    adi = json['Adi'];
    soyadi = json['Soyadi'];
    plaka = json['Plaka'];
    sehir = json['Sehir'];
    bolge = json['Bolge'];
    nakliyeci = json['Nakliyeci'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SoforID'] = soforID;
    data['Kodu'] = kodu;
    data['Adi'] = adi;
    data['Soyadi'] = soyadi;
    data['Plaka'] = plaka;
    data['Sehir'] = sehir;
    data['Bolge'] = bolge;
    data['Nakliyeci'] = nakliyeci;
    return data;
  }
}
