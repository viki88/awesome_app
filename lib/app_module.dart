import 'package:awesome_app/features/galleries/galeries_modul.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module{
  @override
  void binds(Injector i) {
    i.add(
        () => Dio(
            BaseOptions(
              baseUrl: '',
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10)
            )
        )
    );
  }
  
  @override
  void routes(RouteManager r) {
    r.module('/', module: GalleryModule());
  }
}