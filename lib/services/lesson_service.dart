import 'dart:convert';
import 'package:flutter_lesson_method/model/lesson_model.dart';
import 'package:http/http.dart' as http;

class LessonApiService {
  static Future<LessonModel> fetchLessons() async {
    final response = await http.get(
        Uri.parse('https://632017e19f82827dcf24a655.mockapi.io/api/lessons'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return LessonModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load lessons');
    }
  }
}

/*import 'dart:convert';
import 'package:flutter_lesson_method/lesson_model.dart';
import 'package:http/http.dart' as http ;


class ApiService {
  Future<List<UserLessons>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl );
      print('-- API URL --- ${url}');
      var response = await http.get(url);
      print('*** RESPONSE *** ${response.body}');
      if (response.statusCode == 200) {
        print('------ DATA SUCCESS');

        List<UserLessons> userLessonsFromJson(String str) => List<UserLessons>.from(
            json.decode(str).map((x) => UserLessons.fromJson(x)));

        List<UserLessons> model = userLessonsFromJson(response.body);

        print('*** RESPONSE *** ${response.body}');
        return model;
      } else {
        print('================ ERROR ================');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

class ApiConstants {

  static String baseUrl = 'https://632017e19f82827dcf24a655.mockapi.io/api/lessons';

}*/
