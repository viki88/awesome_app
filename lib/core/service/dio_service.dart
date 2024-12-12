import 'package:awesome_app/core/constants/api_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioService{
  static Dio createInstance(){
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.pexelBaseURL,
        headers: {
          'Authorization': ApiConstant.pexelApiKey
        },
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10)
      )
    );

    if(kDebugMode){
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: false,
          responseHeader: false,
          error: true,
          compact: false,
          maxWidth: 90
        )
      );
    }

    return dio;
  }
}