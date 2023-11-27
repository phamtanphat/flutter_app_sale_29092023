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
}