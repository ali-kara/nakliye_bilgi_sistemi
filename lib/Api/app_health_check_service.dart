import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nakliye_bilgi_sistemi/Api/system_state.dart';
import 'package:nakliye_bilgi_sistemi/Global/Constants/_links.dart';
import 'package:nakliye_bilgi_sistemi/Global/Utils/user_messages.dart';

class AppHealthCheckService {
  final Dio _dio = Dio(BaseOptions(baseUrl: BASE_URL));
  var header = {"Content-Type": "application/json"};

  Future<SystemState?> getAppHealth(BuildContext context) async {
    try {
      var response = await _dio.get(
        CHECK_APP_HEALTH,
        options: Options(headers: header),
      );

      var data = response.data["data"];

      if (response.statusCode == HttpStatus.ok) {
        SystemState sysState = SystemState.fromJson(data);

        return sysState;
      }

      return null;
    } catch (e) {
      debugPrint(e.toString());

      showSnackbarError(
        context,
        e.toString(),
      );
      return null;
    }
  }
}
