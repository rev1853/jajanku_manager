import 'dart:convert';

import "package:http/http.dart" as http;

class LoginServices {
  String BASE_URL = "http://192.168.43.205/jajanku-api/api/login";

  Future<Map> login(String email, String password) async {
    var url = Uri.parse(BASE_URL);
    var response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
      },
    );

    return await jsonDecode(response.body);
  }
}
