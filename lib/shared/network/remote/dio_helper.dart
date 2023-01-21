import 'package:dio/dio.dart';

import '../../const/const.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: endPoint,
        receiveDataWhenStatusError: true,
        headers: {'Accept': 'application/json'},
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    return await dio!.get(url,
        queryParameters: query,
        options: Options(
          headers: {"authorization": "Bearer $token"},
        ));
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    return await dio!.post(
      url,
      queryParameters: query,
      options: Options(
        headers: {"authorization": "Bearer $token"},
      ),
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    return await dio!.put(
      url,
      queryParameters: query,
      options: Options(
        headers: {"authorization": "Bearer $token"},
      ),
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    return await dio!.delete(
      url,
      queryParameters: query,
      options: Options(
        headers: {"authorization": "Bearer $token"},
      ),
      data: data,
    );
  }
}
