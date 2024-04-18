import 'dart:io';

import 'package:dio/dio.dart';

import '../Global/Constants/_links.dart';
import '../ViewModels/servis_response.dart';
import '../Model/sofor.dart';
import '../ViewModels/sofor_login.dart';

abstract class IAuthService {
  Future<ServisResponse<Sofor>> login(SoforLogin soforlogin);
  Future<Sofor?> login2(SoforLogin soforLogin);
}

class AuthService implements IAuthService {
  final Dio _dio = Dio(BaseOptions(baseUrl: BASE_URL));

  @override
  Future<ServisResponse<Sofor>> login(SoforLogin soforlogin) async {
    var response = await _dio.post(
      LOGIN_URL,
      data: soforlogin,
      options: Options(headers: {"Content-Type": "application/json"}),
    );

    var res = ServisResponse<Sofor>();

    if (response.statusCode != HttpStatus.ok) {
      res.success = false;
      return res;
    }

    if (!response.data["success"]) {
      res.success = response.data["success"];
      res.message = response.data["message"];
    } else {
      Sofor s = Sofor.fromJson(response.data["data"]);
      res.data = s;
    }

    return res;
  }

  @override
  Future<Sofor?> login2(SoforLogin soforLogin) async {
    var res = ServisResponse<Sofor>();

    var response = await _dio.post(
      LOGIN_URL,
      data: soforLogin,
      options: Options(headers: {"Content-Type": "application/json"}),
    );

    var data = response.data["data"];

    if (response.statusCode == HttpStatus.ok) {
      Sofor sofor = data.map((e) => Sofor.fromJson(e));
      res.data = sofor;
      res.success = true;
      res.message = response.data["message"];
    }

    return null;
  }
}
