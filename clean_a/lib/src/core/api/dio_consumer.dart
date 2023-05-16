import 'dart:io';
import 'package:clean_a/src/core/api/api_consumer.dart';
import 'package:clean_a/src/core/api/endpoints.dart';
import 'package:clean_a/src/core/api/status_code.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

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
    ..validateStatus = (status){
      return status! < StatusCode.internalServerError;
    };


  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters}) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
