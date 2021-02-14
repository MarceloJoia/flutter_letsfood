import 'package:dio/dio.dart';

class DioClient () {
  
  Dio _dio;

  DioClient () {
    _dio = new Dio();
  }

  Future<dynamic> get(String url) {
    _dio.get();
  }
}