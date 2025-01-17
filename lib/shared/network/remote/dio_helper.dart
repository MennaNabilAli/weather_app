import 'package:dio/dio.dart';

class DioHelper
{
  static late Dio dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.openweathermap.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async
  {
    dio.options.headers = {
      'Content_Type':'application/json',
    };
    return await dio.get(url , queryParameters: query,);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,

  }) async
  {
    dio.options.headers = {
      'Content_Type':'application/json',
    };
    return dio.post(
      url ,
      queryParameters: query ,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,

  }) async
  {
    dio.options.headers = {
      'Content_Type':'application/json',
    };
    return dio.put(
      url ,
      queryParameters: query ,
      data: data,
    );
  }
}