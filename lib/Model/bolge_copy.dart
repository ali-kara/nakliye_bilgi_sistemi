// import 'package:json_annotation/json_annotation.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:nakliye_bilgi_sistemi/Global/Constants/_hive_types.dart';

// part 'bolge_copy.g.dart';

// @JsonSerializable()
// // @HiveType(typeId: HiveTypes.bolgeTypeId)
// class Bolge_ {
//   // @HiveField(0)
//   int? bolgeId;
//   // @HiveField(1)
//   String? bolgeAdi;
//   // @HiveField(2)
//   String? aciklama;

//   Bolge({bolgeId, bolgeAdi, aciklama});

//   factory Bolge.fromJson(Map<String, dynamic> json) {
//     return _$BolgeFromJson(json);
//   }

//   Map<String, dynamic> toJson() {
//     return _$BolgeToJson(this);
//   }
// }

// class BolgeResponseModel {
//   List<Bolge>? data;
//   bool? success;
//   String? message;

//   BolgeResponseModel({this.data, this.success, this.message});

//   BolgeResponseModel.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = List<Bolge>();
//       json['data'].forEach((v) {
//         data?.add(Bolge.fromJson(v));
//       });
//     }
//     success = json['success'];
//     message = json['message'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data?.map((v) => v.toJson()).toList();
//     }
//     data['success'] = this.success;
//     data['message'] = this.message;
//     return data;
//   }
// }
// }
