// part 'arac_plaka.g.dart';

// @JsonSerializable()
// @HiveType(typeId: HiveTypes.plakaTypeId)
import 'base_model.dart';

class AracPlaka {
  // @HiveField(0)
  int? plakaId;
  // @HiveField(1)
  String? plaka;
  // @HiveField(2)
  String? aciklama;

  AracPlaka({this.plakaId, this.plaka, this.aciklama});

  AracPlaka.fromJson(Map<String, dynamic> json) {
    plakaId = json['plakaId'];
    plaka = json['plaka'];
    aciklama = json['aciklama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['plakaId'] = plakaId;
    data['plaka'] = plaka;
    data['aciklama'] = aciklama;

    return data;
  }
}

class AracPlakaResponseModel extends BaseModel {
  List<AracPlaka>? data;

  AracPlakaResponseModel({this.data, success, message});

  AracPlakaResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AracPlaka>[];
      json['data'].forEach((v) {
        data!.add(AracPlaka.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}
