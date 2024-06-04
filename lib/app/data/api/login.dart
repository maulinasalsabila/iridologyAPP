import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApi {
  final String baseUrl = 'http://172.20.10.3:5000';

  Future<dynamic> loginUser(Map<String, String> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('access_token', json.decode(response.body)['access_token']);
      return json.decode(response.body);
    } else {
      return null;
    }
  }
}
