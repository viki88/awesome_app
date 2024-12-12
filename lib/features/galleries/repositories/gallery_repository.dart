import 'package:awesome_app/core/constants/api_constant.dart';
import 'package:awesome_app/core/service/dio_service.dart';
import 'package:awesome_app/features/galleries/models/photo_model.dart';
import 'package:dio/dio.dart';

class GalleryRepository{

  final Dio dio = DioService.createInstance();

  Future<List<PhotoModel>> fetchCuratedPhotos({
    int perPage = 15,
    int page = 1
  }) async{
    try{
      final response = await dio.get(
        ApiConstant.pexelCuratedPath,
        queryParameters: {
          ApiConstant.pexelPageParameter : page,
          ApiConstant.pexelPerPageParameter : perPage
        }
      );

      return (response.data['photos'] as List)
          .map((photo) => PhotoModel.fromJson(photo))
          .toList();

    }on DioException catch (e) {
      print('Error fetching photos : ${e.response?.data ?? e.message}');
      throw Exception('Failed to load photos');
    }
  }

}