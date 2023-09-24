import 'base_model.dart';

class BolgeResponseModel extends BaseModel {
  List<Bolge>? data;

  BolgeResponseModel({this.data, success, message});

  BolgeResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Bolge>[];
      json['data'].forEach((v) {
        data!.add(Bolge.fromJson(v));
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

class Bolge {
  int? bolgeId;
  String? bolgeAdi;
  String? aciklama;

  Bolge({this.bolgeId, this.bolgeAdi, this.aciklama});

  Bolge.fromJson(Map<String, dynamic> json) {
    bolgeId = json['bolgeId'];
    bolgeAdi = json['bolgeAdi'];
    aciklama = json['aciklama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bolgeId'] = bolgeId;
    data['bolgeAdi'] = bolgeAdi;
    data['aciklama'] = aciklama;
    return data;
  }
}
