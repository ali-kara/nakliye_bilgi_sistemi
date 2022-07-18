import 'package:dio/dio.dart';
import 'package:nakliye_bilgi_sistemi/Global/Constants/_links.dart';
import 'package:nakliye_bilgi_sistemi/Model/tombala_insert.dart';

class TombalaService {
  Dio _dio;
  TombalaService() : _dio = Dio(BaseOptions(baseUrl: BASE_URL));

  Future<bool> insert(TombalaInsert model) async {
    var response = await _dio.post(
      TOMBALA_INSERT,
      data: model,
    );

    return response.data["Success"];
  }
}
