import 'package:dio/dio.dart';

import '../../data/data.dart';
import '../cores.dart';

class NetworkService {
  NetworkService();
  Dio get _dio => Dio(
        BaseOptions(
          headers: {
            "X-CoinAPI-Key": AppConstants.apiKey,
          },
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
          // connectTimeout: const Duration(seconds: 500),
        ),
      )..interceptors.add(LoggingInterceptor());

  Future<dynamic> get(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      final res = await _dio.get(path, queryParameters: queryParams);
      return res.data;
    } on DioException catch (e) {
      throw ApiFailure(e.message ?? 'Something went wrong!');
    }
  }

  Future<dynamic> post(
    String path, {
    Object? data,
  }) async {
    try {
      final res = await _dio.post(path, data: data);
      return res.data;
    } on DioException catch (e) {
      throw ApiFailure(e.message ?? 'Something went wrong!');
    }
  }

  Future<dynamic> postFormData(
    String path, {
    Object? data,
    Map<String, dynamic>? file,
  }) async {
    try {
      Map<String, dynamic> map = <String, dynamic>{};
      if (file != null) {
        for (var value in file.entries) {
          if (value.value is List) {
            map[value.key] = (value.value as List)
                .map((e) => MultipartFile.fromFileSync(e))
                .toList();
          } else {
            map[value.key] = MultipartFile.fromFileSync(value.value);
          }
        }
      }
      FormData formData = FormData.fromMap(map);
      if (data != null) {
        formData.fields.addAll((data as Map<String, String>).entries);
      }
      final res = await _dio.post(path, data: formData);
      return res.data;
    } on DioException catch (e) {
      throw ApiFailure(e.message ?? 'Something went wrong!');
    }
  }

  Future<dynamic> patch(String path, {Object? data}) async {
    try {
      final res = await _dio.patch(path, data: data);
      return res.data;
    } on DioException catch (e) {
      throw ApiFailure(e.message ?? 'Something went wrong!');
    }
  }

  Future<dynamic> put(String path, {Object? data}) async {
    try {
      final res = await _dio.put(path, data: data);
      return res.data;
    } on DioException catch (e) {
      throw ApiFailure(e.message ?? 'Something went wrong!');
    }
  }

  Future<dynamic> delete(String path) async {
    try {
      final res = await _dio.delete(path);
      return res.data;
    } on DioException catch (e) {
      throw ApiFailure(e.message ?? 'Something went wrong!');
    }
  }
}
