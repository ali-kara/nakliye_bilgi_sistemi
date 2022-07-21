import '../Global/Constants/_hive_types.dart';
import 'package:hive_flutter/adapters.dart';

part 'bolge.g.dart';

@HiveType(typeId: HiveTypes.bolgeTypeId)
class Bolge {
  @HiveField(0)
  int? bolgeId;
  @HiveField(1)
  String? bolgeAdi;
  @HiveField(2)
  String? aciklama;

  Bolge({bolgeId, bolgeAdi, aciklama});

  Bolge.fromJson(Map<String, dynamic> json) {
    bolgeId = json['BolgeId'];
    bolgeAdi = json['BolgeAdi'];
    aciklama = json['Aciklama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['BolgeId'] = bolgeId;
    data['BolgeAdi'] = bolgeAdi;
    data['Aciklama'] = aciklama;

    return data;
  }
}
