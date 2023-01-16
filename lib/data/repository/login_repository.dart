import 'dart:convert';
import 'package:dio/dio.dart';
import '../const/const.dart';

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
