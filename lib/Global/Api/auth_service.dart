import 'dart:convert';

import 'package:nakliye_bilgi_sistemi/Global/Api/Links.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Login(data) async {
    return await http.post(
      Uri.parse(LOGIN_URL),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

  _setHeaders() => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
}
