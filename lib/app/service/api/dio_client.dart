import 'dart:io';


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';

Future<Response?> configDio({
  @required baseUrl,
  mode = "get",
  endPoint,
  param,
  token,
  savePath,
}) async {
  Response? response;
  try {
    var options = BaseOptions(
      baseUrl: baseUrl,
      headers: {
        HttpHeaders.contentTypeHeader: Headers.jsonContentType,
        HttpHeaders.authorizationHeader: "Bearer ${token}",
      },
      responseType: ResponseType.json,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      },
    );
    var dio = Dio(options);
    dio.interceptors.add(LogInterceptor(responseBody: true));
    if (mode == "get") {
      response = await dio.get(endPoint, queryParameters: param);
    } else if (mode == "post") {
      response = await dio.post(endPoint, data: FormData.fromMap(param));
    } else if (mode == "post_raw") {
      response = await dio.post(endPoint, data: param);
    } else if (mode == "put") {
      response = await dio.put(endPoint, queryParameters: param);
    } else if (mode == "put_raw") {
      response = await dio.put(endPoint, data: param);
    } else if (mode == "delete") {
      response = await dio.delete(endPoint, data: param);
    } else if (mode == "download") {
      response = await dio.download(baseUrl, savePath);
    }
    // print("configDio url ${endPoint}${path}");
    print("#40 configDio param ${param}");
    // print("configDio result ${response}");
  } on DioException catch (e) {
    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx and is also not 304.
    if (e.response != null) {
      response = e.response;
      print('#40 configDio Dio error!');
      print('#40 configDio STATUS: ${e.response?.statusCode}');
      print('#40 configDio DATA: ${e.response?.data}');
      print('#40 configDio HEADERS: ${e.response?.headers}');
    } else {
      // Error due to setting up or sending the request
      print('#40 configDio Error sending request!');
      print(e.message);
      
    }
  }
  return response;
}
