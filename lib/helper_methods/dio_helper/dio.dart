import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://wasela.innovations-eg.com/",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    required String? token,
    required String? accessToken,
    required String? authorization,
    required Map<String, dynamic> data,
  }) {
    dio!.options.headers={
      "token": token ?? "",
      "access_token": accessToken ?? "",
      "Authorization": authorization ?? "",
    };
    return dio!.post(url, data: data);
  }


  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? data,
    required String ? authorization,
  }) {
    dio!.options.headers={
      "Authorization": authorization ?? "",
    };
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
