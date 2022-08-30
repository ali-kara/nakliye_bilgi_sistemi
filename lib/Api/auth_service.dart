import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nakliye_bilgi_sistemi/Global/Constants/_links.dart';
import 'package:nakliye_bilgi_sistemi/Model/sofor.dart';

import '../Model/servis_response.dart';
import '../ViewModels/sofor_login.dart';

abstract class IAuthService {
  Future<ServisResponse> login(SoforLogin soforlogin);
}

class AuthService implements IAuthService {
  final Dio _dio;
  AuthService() : _dio = Dio(BaseOptions(baseUrl: BASE_URL));

  @override
  Future<ServisResponse> login(SoforLogin soforlogin) async {
    var response = await _dio.post(
      LOGIN_URL,
      data: soforlogin,
    );

    var res = ServisResponse();

    if (response.statusCode != HttpStatus.ok) {
      res.success = false;
      return res;
    }

    if (!response.data["Success"]) {
      res.success = response.data["Success"];
      res.message = response.data["Message"];
    } else {
      Sofor s = Sofor.fromJson(response.data['Data']);
      res.data = s;
    }

    return res;
  }
}
