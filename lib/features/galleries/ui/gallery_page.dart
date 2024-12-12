import 'package:awesome_app/features/galleries/controllers/gallery_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';

class GalleryPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<GalleryController>();

    return SafeArea(
        child: Scaffold(
            body: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
                return <Widget>[
                  SliverAppBar(
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.more_vert, color: Colors.white),
                          onPressed: (){}
                      )
                    ],
                    backgroundColor: Colors.green,
                    title: const Text(
                      'Awesome App',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  )
                ];
              },
              body: Obx(() {
                if(controller.isLoading.value && controller.photos.isEmpty){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if(controller.error.value.isNotEmpty){
                  return Center(
                    child: Text(controller.error.value),
                  );
                }

                return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4
                    ),
                    itemCount: controller.photos.length + 1,
                    itemBuilder: (context, index) {
                      if(index == controller.photos.length){
                        controller.fetchCuratedPhotos();
                        return const Center(child: CircularProgressIndicator());
                      }

                      final photo = controller.photos[index];
                      return Image.network(
                        photo.mediumUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress){
                          if(loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes !
                              : null ,
                            ),
                          );
                        },
                      );
                    }
                );
              }),
            )
        )
    );
  }

}