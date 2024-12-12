import 'package:awesome_app/features/galleries/controllers/gallery_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GalleryPage extends StatelessWidget{
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GalleryController());

    return Scaffold(
        body:
        CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                IconButton(
                    icon: const Icon(Icons.more_vert, color: Colors.white),
                    onPressed: (){}
                )
              ],
              pinned: true,
              flexibleSpace: const FlexibleSpaceBar(
                title: Text(
                  'Awesome App',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
              backgroundColor: Colors.green,
            ),
            Obx((){
              // if(controller.isLoading.value){
              //   return const Center( child: CircularProgressIndicator());
              // }else {
                return SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                        childCount: controller.photos.length,
                            (context, index){
                          final photo = controller.photos[index];
                          return Image.network(
                            photo.mediumUrl,
                            fit: BoxFit.cover,
                          );
                        }
                    ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 1
                    )
                );
              //}
            })
          ],
        )
    );
  }

}