import 'package:dio/dio.dart';
import 'package:nakliye_bilgi_sistemi/Global/Constants/_links.dart';
import 'package:nakliye_bilgi_sistemi/Model/tombala.dart';

import 'dart:io';

import '../ViewModels/tombala_get.dart';
import '../ViewModels/tombala_insert.dart';

class TombalaService {
  final Dio _dio;
  TombalaService() : _dio = Dio(BaseOptions(baseUrl: BASE_URL));

  Future<bool> insert(TombalaInsert model) async {
    var response = await _dio.post(
      TOMBALA_INSERT,
      data: model,
    );

    return response.data["Success"];
  }

  Future<List<NakliyeTombala>?> getList() async {
    var parameter = TombalaGet();
    parameter.bolge = "İZMİR";
    parameter.plaka = "35AP0635";
    parameter.soforKodu = "ANKİBO";

    var response = await _dio.post(TOMBALA_GET, data: parameter);

    var data = response.data["Data"];

    if (response.statusCode == HttpStatus.ok) {
      if (data is List) {
        List<NakliyeTombala> list =
            data.map((e) => NakliyeTombala.fromJson(e)).toList();

        return list;
      }
    }

    return null;
  }
}
