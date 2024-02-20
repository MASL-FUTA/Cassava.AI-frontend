import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:masl_futa_agric/model/sign_in_response.dart';
import 'package:masl_futa_agric/service/local_storage.dart';

class AuthRepo {
  static Future<AuthResponse> signIn(String email, String password) async {
    var request = http.Request(
      'POST',
      Uri.parse('https://cassavaai.onrender.com/auth/login'),
    );
    request.body = jsonEncode({"email": email, "password": password});
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      var data = jsonDecode(str) as Map<String, String>;
      LocalStorage.setString('auth', data['access_token']!);
      return Future.value(AuthResponse(success: true, message: 'Success'));
    } else {
      return Future.value(AuthResponse(
        success: false,
        message: response.reasonPhrase ?? 'Failed',
      ));
    }
  }

  static Future<AuthResponse> signUp(String email, String password) async {
    var request = http.Request(
      'POST',
      Uri.parse('https://cassavaai.onrender.com/auth/register'),
    );
    request.body = jsonEncode({"email": email, "password": password});
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //await response.stream.bytesToString();
      return Future.value(AuthResponse(success: true, message: 'Success'));
    } else {
      return Future.value(AuthResponse(
        success: false,
        message: response.reasonPhrase ?? 'Failed',
      ));
    }
  }
}
