import 'package:awesome_app/core/constants/api_constant.dart';
import 'package:dio/dio.dart';

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

    return dio;
  }
}