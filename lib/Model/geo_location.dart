// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

import '../Global/Constants/_hive_types.dart';

part 'geo_location.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveTypes.geoLocationTypeId)
class GeoLocation {
  @HiveField(0)
  double? latitude;
  @HiveField(1)
  double? longitude;

  GeoLocation({this.latitude, this.longitude});

  factory GeoLocation.fromJson(Map<String, dynamic> json) {
    return _$GeoLocationFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GeoLocationToJson(this);
  }
}

class GeoLocationInsert {
  double? longitude;
  double? latitude;
  String? sofor_Kodu;
  int? soforSessionId;

  GeoLocationInsert({
    this.soforSessionId,
    this.longitude,
    this.latitude,
    this.sofor_Kodu,
  });

  GeoLocationInsert.fromJson(Map<String, dynamic> json) {
    longitude = json['longitude'];
    latitude = json['latitude'];
    sofor_Kodu = json['sofor_Kodu'];
    soforSessionId = json['soforSessionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['sofor_Kodu'] = sofor_Kodu;
    data['soforSessionId'] = soforSessionId;
    return data;
  }
}
