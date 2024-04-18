import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nakliye_bilgi_sistemi/Model/app_version.dart';
import 'package:nakliye_bilgi_sistemi/Api/system_state.dart';
import 'package:nakliye_bilgi_sistemi/Global/Constants/_links.dart';
import 'package:nakliye_bilgi_sistemi/Global/Utils/user_messages.dart';
import 'package:nakliye_bilgi_sistemi/ViewModels/servis_response.dart';
import 'package:package_info_plus/package_info_plus.dart';

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

  Future<ServisResponse<AppVersion>?> checkAppVersion(
      BuildContext context) async {
    var serviceResp = ServisResponse<AppVersion>();

    try {
      var appVersion = await getAppVersion();
      var devicePlatform = getDevicePlatform();

      var requestData = {
        'appVersion': appVersion,
        'platform': devicePlatform,
      };

      // AppVersionRequest requestData = AppVersionRequest(
      //   appVersion: _appVersion,
      //   platform: _devicePlatform
      // );

      var response = await _dio.get(
        GET_APP_VERSION,
        queryParameters: requestData,
        options: Options(headers: header),
      );

      var data = response.data["data"];
      var message = response.data["message"];

      if (response.statusCode == HttpStatus.ok) {
        if (data != null) {
          AppVersion appVersion = AppVersion.fromJson(data);

          serviceResp.data = appVersion;
          serviceResp.message = message;
        }
      }

      return serviceResp;
    } catch (e) {
      debugPrint(e.toString());

      showSnackbarError(
        context,
        e.toString(),
      );
      return null;
    }
  }

  getDevicePlatform() {
    if (Platform.isIOS) {
      return 0;
    } else if (Platform.isAndroid) {
      return 1;
    } else if (kIsWeb) {
      return 2;
    } else if (Platform.isWindows) {
      return 3;
    }
  }

  getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
}
