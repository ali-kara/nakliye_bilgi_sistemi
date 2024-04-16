import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nakliye_bilgi_sistemi/Global/Constants/_links.dart';
import 'package:nakliye_bilgi_sistemi/Model/bolge.dart';
import 'package:nakliye_bilgi_sistemi/Model/arac_plaka.dart';

abstract class IGirisEkraniService {
  Future<List<AracPlaka>?> getPlaka();
  Future<List<Bolge>?> getBolge();
}

var models = <Bolge>[];
var modelAracPlaka = <AracPlaka>[];

class GirisEkraniServis implements IGirisEkraniService {
  final Dio _dio;
  GirisEkraniServis()
      : _dio = Dio(
          BaseOptions(
            baseUrl: BASE_URL,
          ),
        );

  @override
  Future<List<AracPlaka>?> getPlaka() async {
    final response = await _dio.get(PLAKA_GET);

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;

      if (data is Map<String, dynamic>) {
        final res = AracPlaka.fromJson(data);
        modelAracPlaka = res.data ?? [];
      } else if (data is List) {
        modelAracPlaka = data.map((e) => AracPlaka.fromJson(e)).toList();
      }
    }

    return modelAracPlaka;
  }

  @override
  Future<List<Bolge>?> getBolge() async {
    final response = await _dio.get(BOLGE_GET);

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;

      if (data is Map<String, dynamic>) {
        final res = Bolge.fromJson(data);
        models = res. ?? [];
      } else if (data is List) {
        models = data.map((e) => Bolge.fromJson(e)).toList();
      }
    }

    return models;
  }
}
