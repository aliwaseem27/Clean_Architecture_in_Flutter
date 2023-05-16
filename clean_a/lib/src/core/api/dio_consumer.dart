import 'dart:convert';
import 'dart:io';
import 'package:clean_a/src/core/api/api_consumer.dart';
import 'package:clean_a/src/core/api/app_interceptors.dart';
import 'package:clean_a/src/core/api/endpoints.dart';
import 'package:clean_a/src/core/api/status_code.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:clean_a/src/injection_container.dart' as di;
import 'package:flutter/foundation.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    (client.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.internalServerError;
      };

    client.interceptors.add(di.sl<AppInterceptors>());
    if (kDebugMode) {
      client.interceptors.add(di.sl<LogInterceptor>());
    }
  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    final response = await client.get(path, queryParameters: queryParameters);
    return _handleResponseAsJson(response);
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters}) async {
    final response = await client.post(path, queryParameters: queryParameters, data: body);
    return _handleResponseAsJson(response);
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters}) async {
    final response = await client.put(path, queryParameters: queryParameters, data: body);
    return _handleResponseAsJson(response);
  }

  dynamic _handleResponseAsJson (Response<dynamic> response){
    final responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }
}
