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
}
