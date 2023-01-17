import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../const/const.dart';

Future<void> saveEmail(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}



Future userLogin(String email) async {
  Dio dio = Dio();
   
  try {
    Response response = await dio.post('$baseUrl/user/new',
        data: json.encode({"email": email}));

    print(response);
  } catch (e) {
    print('error-->$e');
  }
}
