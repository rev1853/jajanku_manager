import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:jajanku_manager/constants/HTTPConstant.dart';

class LoginService {
  String BASE_URL = "$API_URL/login";

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
