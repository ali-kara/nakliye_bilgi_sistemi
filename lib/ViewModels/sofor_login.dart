import 'package:json_annotation/json_annotation.dart';

part 'sofor_login.g.dart';

@JsonSerializable()
class SoforLogin {
  String? userName;
  String? password;

  SoforLogin({this.userName, this.password});

  factory SoforLogin.fromJson(Map<String, dynamic> json) {
    return _$SoforLoginFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SoforLoginToJson(this);
  }
}
