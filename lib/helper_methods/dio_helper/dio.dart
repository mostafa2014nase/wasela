import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "",
        receiveDataWhenStatusError: true,
        headers: {},
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
  }) {
    return dio!.post(url, data: data);
  }


  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> data,
  }) {
    return dio!.get(url,queryParameters: data);
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
  }) {
    return dio!.put(url,queryParameters: data);
  }

  static Future<Response> requestData({
    required String url,
    required Map<String, dynamic> data,
  }) {
    return dio!.request(url,queryParameters: data);
  }

  static clearData() {
     dio!.clear();
  }
}
