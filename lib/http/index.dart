import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Http {
  static BaseOptions options = BaseOptions(
      baseUrl: 'https://m.mi.com/v1/',
      connectTimeout: 60000,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Referer': 'https://m.mi.com/'
      });

  static Dio dio = Dio(options);

  static get(
      {@required String path,
      Map<String, String> data = const {},
      options}) async {
    try {
      Response response = await dio.get(path, queryParameters: addParam(data));
      return response.data;
    } on DioError catch (e) {
      formatError(e);
    }
  }

  static post(
      {@required String path,
      Map<String, String> data = const {},
      options}) async {
    try {
      Response response = await dio.post(path, queryParameters: addParam(data));
      if (response.statusCode == 200) {
        return response.data['data'];
      }
    } on DioError catch (e) {
      formatError(e);
    }
  }

  static Map addParam(Map<String, String> data) {
    data['client_id'] = "180100031051";
    data['webp'] = "1";
    return data;
  }

  /*
   * error统一处理
   */
  static void formatError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      // It occurs when url is opened timeout.
      print("连接超时");
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      // It occurs when url is sent timeout.
      print("请求超时");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      //It occurs when receiving timeout
      print("响应超时");
    } else if (e.type == DioErrorType.RESPONSE) {
      // When the server response, but with a incorrect status, such as 404, 503...
      print("出现异常");
    } else if (e.type == DioErrorType.CANCEL) {
      // When the request is cancelled, dio will throw a error with this type.
      print("请求取消");
    } else {
      //DEFAULT Default error type, Some other Error. In this case, you can read the DioError.error if it is not null.
      print("未知错误");
    }
  }
}
