import 'package:awesome_app/core/service/dio_service.dart';
import 'package:awesome_app/features/galleries/controllers/gallery_controller.dart';
import 'package:awesome_app/features/galleries/repositories/gallery_repository.dart';
import 'package:awesome_app/features/galleries/ui/gallery_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GalleryModule extends Module{

  @override
  void binds(Injector i) {
    i.addInstance(DioService.createInstance());
    i.add(() => GalleryRepository(i()));
    i.add(() => GalleryController(i()));
  }
  
  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => GalleryPage());
  }
}