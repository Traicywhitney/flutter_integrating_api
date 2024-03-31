import 'dart:convert';
import 'package:flutter_lesson_method/model/program_model.dart';
import 'package:http/http.dart' as http;

class ProgramApiService {
  static Future<ProgramModel> fetchLessons() async {
    final response = await http.get(
        Uri.parse('https://632017e19f82827dcf24a655.mockapi.io/api/programs'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return ProgramModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load lessons');
    }
  }
}
