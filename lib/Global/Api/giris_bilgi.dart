import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nakliye_bilgi_sistemi/Global/Api/Links.dart';
import 'package:nakliye_bilgi_sistemi/Model/plaka.dart';

class girisEkraniServis {
  Future<List<Plaka>> getPlaka() async {
    var response = await http.get(
      Uri.parse(PLAKA_GET),
      headers: _setHeaders(),
    );

    final Map<String, dynamic> responseData = json.decode(response.body);

    final list = (responseData as List).map((e) => Plaka.fromJson(e)).toList();

    return list;
  }

  BolgeGet() async {
    return await http.post(
      Uri.parse(BOLGE_GET),
      headers: _setHeaders(),
    );
  }

  _setHeaders() => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
}
