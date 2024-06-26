import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nakliye_bilgi_sistemi/Global/Constants/_links.dart';
import 'package:nakliye_bilgi_sistemi/Global/Utils/user_messages.dart';
import 'package:nakliye_bilgi_sistemi/Managers/sofor_manager.dart';
import 'package:nakliye_bilgi_sistemi/Model/tombala.dart';

import '../ViewModels/tombala_get.dart';
import '../ViewModels/tombala_insert.dart';

class TombalaService {
  final Dio _dio = Dio(BaseOptions(baseUrl: BASE_URL));
  var header = {"Content-Type": "application/json"};

  Future<bool> insert(TombalaInsert model, BuildContext context) async {
    try {
      var response = await _dio.post(
        TOMBALA_INSERT,
        data: model,
        options: Options(headers: header),
      );

      return response.data["success"];
    } catch (e) {
      showSnackbarError(context, e.toString());
      return false;
    }
  }

  Future<List<NakliyeTombala>?> getList() async {
    var parameter = TombalaGet(
      bolge: await SoforManager.bolge,
      plaka: await SoforManager.plaka,
      soforKodu: await SoforManager.soforKodu,
    );

    var response = await _dio.post(
      TOMBALA_GET,
      data: parameter,
      options: Options(headers: header),
    );

    var data = response.data["data"];

    if (response.statusCode == HttpStatus.ok) {
      if (data is List) {
        List<NakliyeTombala> list =
            data.map((e) => NakliyeTombala.fromJson(e)).toList();

        return list;
      }
    }

    return null;
  }

//   Future<List<NakliyeTombala2>?> getListwithVexana() async {
//     var parameter = TombalaGet();

//     parameter.bolge = "İZMİR";
//     parameter.plaka = "06CFM475";
//     parameter.sofor_Kodu = "ANKİBO";

//     INetworkManager networkManager = NetworkManager(
//       options: BaseOptions(baseUrl: BASE_URL),
//     );

//     final response = await networkManager
//         .send<NakliyeTombala2(), ServisResponse<NakliyeTombala2>>(
//       TOMBALA_GET,
//       parseModel: NakliyeTombala2(),
//       method: RequestType.GET,
//     );

//     return null;
//   }
}
