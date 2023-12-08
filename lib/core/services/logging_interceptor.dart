import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../cores.dart';

class LoggingInterceptor extends Interceptor {
  final int _maxCharactersPerLine = 200;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      Console.log('==>', '<== REQUEST ==>');
      Console.log(
          'REQUEST[${options.method}]', '==> ${options.uri.toString()}');
      Console.log('Data', '---> ${options.data}');
      Console.log("Auth", "--> ${options.headers['Authorization']}");
      Console.log('Params', "--> ${options.queryParameters}");
      Console.log("Content Type", "--> ${options.contentType}");
      Console.log("END", "----------------->");
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      Console.log('==>', '<== RESPONSE ==>');
      Console.log('RESPONSE[${response.statusCode}]',
          '=> PATH: ${response.requestOptions.uri.toString()}');
      Console.log('Data', '=> ${response.data}');
      Console.log("END", "----------------->");
      print("<-- END HTTP");
    }
    return super.onResponse(response, handler);
  }

  final _cache = <Uri, Response>{};

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      Console.log('==>', "<== ERROR ==>");
      Console.log(
        'ERROR[${err.response?.statusCode}]',
        ' => PATH: ${err.requestOptions.uri.toString()}',
      );
      Console.log('Error', "-->  ${err.error}");
      Console.log('Data', "--> ${err.response?.data}");
    }

    if (err.response?.data['message'] != null) {
      err = err.copyWith(message: err.response?.data['message']);
    }
    return super.onError(err, handler);
  }
}
