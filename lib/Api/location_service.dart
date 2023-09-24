import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nakliye_bilgi_sistemi/Model/geo_location.dart';

import '../Global/Constants/_links.dart';
import '../Model/servis_response.dart';

class LocationService {
  final Dio _dio;
  LocationService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: BASE_URL,
            connectTimeout: const Duration(seconds: 10),
          ),
        );

  Future<ServisResponse> insert(GeoLocationInsert model) async {
    var res = ServisResponse();

    try {
      var response = await _dio.post(
        LOCATION_INSERT,
        data: model,
      );

      if (response.statusCode != HttpStatus.ok) {
        res.success = false;
        return res;
      }

      if (!response.data["Success"]) {
        res.success = response.data["Success"];
        res.message = response.data["Message"];
      }
    } catch (e) {
      res.success = false;
      res.message = e.toString();
    }

    return res;
  }

  Future<ServisResponse> getall() async {
    var res = ServisResponse();

    try {
      var response = await _dio.get(
        LOCATION_GET,
      );

      if (response.statusCode != HttpStatus.ok) {
        res.success = false;
        return res;
      }

      if (!response.data["Success"]) {
        res.success = response.data["Success"];
        res.message = response.data["Message"];
      }
    } catch (e) {
      res.success = false;
      res.message = e.toString();

      //ShowDebug.print(res.message);
    }

    return res;
  }
}
