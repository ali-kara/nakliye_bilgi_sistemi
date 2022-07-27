import 'package:hive_flutter/adapters.dart';

import '../Global/Constants/_hive_types.dart';

part 'geo_location.g.dart';

@HiveType(typeId: HiveTypes.geoLocationTypeId)
class GeoLocation {
  @HiveField(0)
  double? latitude;
  @HiveField(1)
  double? longitude;

  GeoLocation({this.latitude, this.longitude});

  GeoLocation.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class GeoLocationInsert {
  double? longitude;
  double? latitude;
  String? soforKodu;

  GeoLocationInsert({this.longitude, this.latitude, this.soforKodu});

  GeoLocationInsert.fromJson(Map<String, dynamic> json) {
    longitude = json['longitude'];
    latitude = json['latitude'];
    soforKodu = json['SoforKodu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['SoforKodu'] = soforKodu;
    return data;
  }
}
