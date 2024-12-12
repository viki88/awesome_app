
import 'package:awesome_app/features/galleries/galeries_modul.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module{
  @override
  void routes(RouteManager r) {
    r.module('/', module: GalleryModule());
  }
}