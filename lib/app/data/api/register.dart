import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

class RegisterApi {
  // final String? baseUrl = '${dotenv.env['API_BASE_URL']}/register';
  final String baseUrl = 'http://172.20.10.3:5000';
  Future<bool> registerUser(Map<String, String> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
