import 'package:json_annotation/json_annotation.dart';

import '../Global/Constants/_hive_types.dart';
import 'package:hive_flutter/adapters.dart';

part 'bolge.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveTypes.bolgeTypeId)
class Bolge {
  @HiveField(0)
  int? BolgeId;
  @HiveField(1)
  String? BolgeAdi;
  @HiveField(2)
  String? Aciklama;

  Bolge({bolgeId, bolgeAdi, aciklama});

  factory Bolge.fromJson(Map<String, dynamic> json) {
    return _$BolgeFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BolgeToJson(this);
  }
}
