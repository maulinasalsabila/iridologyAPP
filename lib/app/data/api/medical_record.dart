import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MedicalRecordApi {
  final String baseUrl = 'http://172.20.10.3:5000';

  Future<dynamic> getRecord() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');
    if (token != null) {
      final response = await http.get(
        Uri.parse('$baseUrl/record'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return 'failed';
      }
    } else {
      return 'failed';
    }
  }
}
