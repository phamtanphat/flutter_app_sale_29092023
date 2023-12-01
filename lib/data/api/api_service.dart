import 'package:dio/dio.dart';
import 'package:flutter_app_sale_29092023/data/api/dio_client.dart';

class ApiService {
  final Dio _dio = DioClient.getInstance().getDio();

  Future<Response<dynamic>> requestSignIn(String email, String password) {
    return _dio.post("user/sign-in", data: {
      "email": email,
      "password": password,
    });
  }

  Future<Response<dynamic>> requestSignUp(
      String email,
      String password,
      String name,
      String phone,
      String address
    ) {
    return _dio.post("user/sign-up", data: {
      "email": email,
      "password": password,
      "name": name,
      "phone": phone,
      "address": address,
    });
  }
}