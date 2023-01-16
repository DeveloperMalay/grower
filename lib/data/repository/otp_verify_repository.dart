import 'dart:convert';
import 'package:dio/dio.dart';
import '../const/const.dart';

Future verifyOtp(String email, String otp) async {
  Dio dio = Dio();
  try {
    Response response = await dio.post('$baseUrl/user/verify',
        data: json.encode({"email": email, "otp": otp}));
    print("verify otp -->$response");
  } catch (e) {
    print('error-->$e');
  }
}
