import 'package:dio/dio.dart';

import './interceptor/dio_Interceptor.dart';

class DioClient {
  Dio _dio;

  ///Construtor
  DioClient() {
    _dio = dioInterceptor();
  }

  /// Metodo de requisição da API. Com o "response" já temos o retorno exato de nossa API.
  /// Permite enviar parametros "Map<String, dynamic> queryParameters".
  /// Method Get
  Future<dynamic> get(String url,
      {Map<String, dynamic> queryParameters}) async {
    try {
      final Response response =
          await _dio.get(url, queryParameters: queryParameters);
      return response;
    } catch (e) {
      print(e.toString()); // Converte a exception para String
      throw e; // Gera a exception
    }
  }

  /// Method Post
  Future<dynamic> post(String url,
      {formData, Map<String, dynamic> queryParameters}) async {
    try {
      final Response response = await _dio.post(url,
          data: formData, queryParameters: queryParameters);
      return response;
    } catch (e) {
      print(e.toString()); // Converte a exception para String
      throw e; // Gera a exception
    }
  }
}
