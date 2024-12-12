import 'package:awesome_app/features/galleries/ui/gallery_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GalleryModule extends Module{

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => GalleryPage());
  }
}