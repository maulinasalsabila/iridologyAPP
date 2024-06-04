import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ClassificationApi {
  
  final String baseUrl = 'http://172.20.10.3:5000';

  Future<Map<String, dynamic>> classifyImage(File imageFile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');

    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/upload'));

    // Tambahkan token ke header
    request.headers['Authorization'] = 'Bearer $token';

    // Tambahkan file ke body
    request.files.add(
      http.MultipartFile(
        'file',
        imageFile.readAsBytes().asStream(),
        imageFile.lengthSync(),
        filename: 'image.jpg',
      ),
    );

    // Kirim request
    var response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      return json.decode(responseData);
    } else {
      throw Exception('Failed to classify image');
    }
  }
}
