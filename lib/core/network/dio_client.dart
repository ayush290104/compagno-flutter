import 'dart:developer';
import 'dart:io';

import 'package:compagno4/core/network/app_api.dart';
import 'package:compagno4/save_user/network/local_save.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../save_user/constants/constants.dart';

class DioClient {
  // disabling any instance creation of this class
  DioClient._privateConstructor();

  static final DioClient _instance = DioClient._privateConstructor();

  static DioClient get instance => _instance;

  static BaseOptions options = BaseOptions(
    baseUrl: AppApi.baseUrl,
    validateStatus: (status) => true,
    responseType: ResponseType.json,
  );

  final Dio _dio = Dio(options);

  // get api call
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response response = await _dio.get(
        AppApi.baseUrl + url,
        queryParameters: queryParameters,
      );
      debugPrint("Response ${response.statusCode}");

      return response;
    } catch (e) {
      if (e is SocketException) {
        throw Exception("Network Error Or Internet Failure.");
      } else {
        throw Exception("Something went wrong");
      }
    }
  }

// post api call
  Future<Response> post(String url,
      {Map<String, dynamic>? body, Map<String, dynamic>? queryParams}) async {
    try {

      final Response response = await _dio.post(AppApi.baseUrl + url,
          data: body,
          queryParameters: queryParams,
          options: Options(headers: {
            "Authorization": "Bearer ${SaveId.getSaveData(key: token)}"
          }));

      log("response is this ${response.statusCode} with body ${response.data}  with url $url");

      return response;
    } catch (e) {
      log(e.toString());
      if (e is SocketException) {
        throw Exception("Network Error Or Internet Failure.");
      } else {
        throw Exception(e.toString());
      }
    }
  }
}
