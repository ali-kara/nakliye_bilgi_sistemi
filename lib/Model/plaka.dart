import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

import '../Global/Constants/_hive_types.dart';

part 'plaka.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveTypes.plakaTypeId)
class Plaka {
  @HiveField(0)
  int? plakaId;
  @HiveField(1)
  String? plakaAdi;
  @HiveField(2)
  String? aciklama;

  Plaka({plakaId, plakaAdi, aciklama});

  factory Plaka.fromJson(Map<String, dynamic> json) {
    return _$PlakaFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PlakaToJson(this);
  }
}
