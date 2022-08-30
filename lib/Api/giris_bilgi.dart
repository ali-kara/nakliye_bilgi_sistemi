import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nakliye_bilgi_sistemi/Global/Constants/_links.dart';
import 'package:nakliye_bilgi_sistemi/Model/bolge.dart';
import 'package:nakliye_bilgi_sistemi/Model/plaka.dart';

abstract class IGirisEkraniService {
  Future<List<Plaka>?> getPlaka();
  Future<List<Bolge>?> getBolge();
}

class GirisEkraniServis implements IGirisEkraniService {
  final Dio _dio;
  GirisEkraniServis() : _dio = Dio(BaseOptions(baseUrl: BASE_URL));

  @override
  Future<List<Plaka>?> getPlaka() async {
    final response = await _dio.get(PLAKA_GET);

    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data;

      if (datas is List) {
        return datas.map((e) => Plaka.fromJson(e)).toList();
      }
    }

    return null;
  }

  @override
  Future<List<Bolge>?> getBolge() async {
    final response = await _dio.get(BOLGE_GET);

    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data;

      if (datas is List) {
        return datas.map((e) => Bolge.fromJson(e)).toList();
      }
    }

    return null;
  }
}
