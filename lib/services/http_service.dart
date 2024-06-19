
import 'dart:developer';
import 'dart:io';

import 'package:adawal/config/env.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class HttpService {
  String? host;
  BaseOptions? baseOptions;
  Dio? dio;
  int connectTimeout = 60000;
  int receiveTimeout = 60000;

  Future<Map<String, String>> getHeaders() async {
    return {
      HttpHeaders.acceptHeader: "application/json",
      "project_id": Env.projectId,
    } ;

  }

  HttpService() {
    initHttpService();
  }

  initValidateHttps() {
    dio?.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: (){
          final HttpClient client = HttpClient();
          client.badCertificateCallback = (cert, host, port) => true;
          return client;
        },
        validateCertificate: (cert, port, host) {
          if (cert == null) {
            return true;
          }
          return true;
        }
    );
  }


  //get the remote config
  Future<void> initHttpService() async {
    host = Env.baseUrl;
    //initialize dio
    baseOptions = BaseOptions(
        baseUrl: host!,
        connectTimeout: const Duration(seconds: 120),
        receiveTimeout: const Duration(seconds: 120),
        validateStatus: (status) {
          return status! <= 500;
        }

    );
    dio  = Dio(baseOptions);
    // if (AppConfig.shared.flavor == Flavor.dev) initValidateHttps();
    log("base url == ${Env.baseUrl}");
  }


  //get method
  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters, CancelToken? token}) async {
    String uri = "$host$url";
    print(uri);
    return dio!.get(
      uri,
      options: Options(
        headers: await getHeaders(),
      ),
      queryParameters: queryParameters,
    );
  }
  //post method
  Future<Response> post(String url, body, {CancelToken? token, String? idempotencyKey}) async {
    String uri = "$host$url";
    print(uri);
    return dio!.post(
      uri,
      data: body,
      cancelToken: token,
      options: Options(
        headers: await getHeaders()
      ),
    );
  }



}