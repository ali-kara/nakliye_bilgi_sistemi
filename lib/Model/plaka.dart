import 'package:hive_flutter/adapters.dart';

import '../Global/Constants/_hive_types.dart';

part 'plaka.g.dart';

@HiveType(typeId: HiveTypes.plakaTypeId)
class Plaka {
  @HiveField(0)
  int? plakaId;
  @HiveField(1)
  String? plakaAdi;
  @HiveField(2)
  String? aciklama;

  Plaka({plakaId, plakaAdi, aciklama});

  Plaka.fromJson(Map<String, dynamic> json) {
    plakaId = json["PlakaId"];
    plakaAdi = json["Plaka"];
    aciklama = json["Aciklama"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PlakaId'] = plakaId;
    data['Plaka'] = plakaAdi;
    data['Aciklama'] = aciklama;
    return data;
  }
}
