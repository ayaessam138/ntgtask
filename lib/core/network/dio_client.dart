import 'dart:io';
import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../helpers/app_const.dart';



class DioClient {
  static final String _baseUrl = ApiConstants.apiBaseApi;

  static const _rateLimit = 5;
  static final _delayDuration = Duration(
    milliseconds: (1000 / _rateLimit).round(),
  );

  static final Dio _dio =
      Dio()
        ..options.baseUrl = _baseUrl
        ..options.connectTimeout = const Duration(milliseconds: 30000)
        ..options.receiveTimeout = const Duration(milliseconds: 30000)
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) async {
              await Future.delayed(_delayDuration);
              return handler.next(options);
            },
          ),
        )
        ..interceptors.add(
          PrettyDioLogger(
            requestBody: true,
            requestHeader: true,
            responseHeader: true,
            enabled: kDebugMode,
          ),
        )
        ..options.headers.addAll({
          'Content-Type': 'application/json; charset=UTF-8',
          'Cache-Control': 'no-cache',
          'Accept': 'Application/json',
        });

  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final token = "";
    try {
      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: Options(
          method: 'GET',
          headers: {'Authorization': 'Bearer $token'},
        ),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException {
      throw const FormatException("Unable to process the data");
    } on DioException catch (e) {
      throw DioException(
        requestOptions: e.requestOptions,
        error: e.error,
        type: e.type,
        response: e.response,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final token = "";
    try {
      var response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: DioOptions().copyWith(
          method: 'POST',
          headers: {'Authorization': 'Bearer $token'},
        ),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      throw DioException(
        requestOptions: e.requestOptions,
        error: e.error,
        type: e.type,
        response: e.response,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final token = "";
    try {
      var response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: DioOptions().copyWith(
          method: 'PUT',
          headers: {'Authorization': 'Bearer  $token'},
        ),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      throw DioException(
        requestOptions: e.requestOptions,
        error: e.error,
        type: e.type,
        response: e.response,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final token = "";

    try {
      var response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: DioOptions().copyWith(
          method: 'DELETE',
          headers: {'Authorization': 'Bearer $token'},
        ),
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      throw DioException(
        requestOptions: e.requestOptions,
        error: e.error,
        type: e.type,
        response: e.response,
      );
    } catch (e) {
      rethrow;
    }
  }
}

class DioOptions extends Options {
  @override
  String get contentType => 'application/json; charset=UTF-8';
  @override
  Map<String, dynamic> get headers => {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'Application/json',
  };
}
