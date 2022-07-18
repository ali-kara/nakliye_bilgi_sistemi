import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nakliye_bilgi_sistemi/Global/Constants/_links.dart';
import 'package:nakliye_bilgi_sistemi/Global/utils/alert.dart';
import 'package:nakliye_bilgi_sistemi/Model/sofor.dart';

abstract class IAuthService {
  Future<bool> login(soforLogin soforlogin);
}

class AuthService implements IAuthService {
  final Dio _dio;
  AuthService() : _dio = Dio(BaseOptions(baseUrl: BASE_URL));

  @override
  Future<bool> login(soforLogin soforlogin) async {
    var response = await _dio.post(
      LOGIN_URL,
      data: soforlogin,
    );

    //Sofor s = Sofor.fromJson(response.data['Data']);

    return response.statusCode == HttpStatus.ok;
  }
}
