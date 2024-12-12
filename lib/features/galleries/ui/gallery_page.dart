import 'package:awesome_app/features/galleries/controllers/gallery_controller.dart';
import 'package:awesome_app/features/galleries/controllers/toggle_list_controller.dart';
import 'package:awesome_app/features/galleries/ui/detail_gallery_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GalleryPage extends StatelessWidget{
  final GalleryController controller = Get.put(GalleryController());
  final ToggleListController toggleListController = Get.put(ToggleListController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:
        RefreshIndicator(
            onRefresh: controller.refreshFetch,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                actions: [
                  IconButton(
                      icon: Obx(() => Icon(
                        color: Colors.white,
                          !toggleListController.isGridView.value ? Icons.grid_view : Icons.view_list
                      )),
                      onPressed: (){
                        toggleListController.toggleView();
                      }
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
                if(controller.isLoading.value){
                  return SliverToBoxAdapter(
                      child: Container()
                  );
                }
                  if(toggleListController.isGridView.value){
                    return SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                            childCount: controller.photos.length,
                                (context, index){
                              final photo = controller.photos[index];
                              return GestureDetector(
                                onTap: (){
                                  Get.to(() => DetailGalleryPage(photoModel: photo));
                                },
                                child: Hero(
                                    tag: 'gallery_tag$index',
                                    child: CachedNetworkImage(
                                      imageUrl: photo.mediumUrl,
                                      fit: BoxFit.cover,
                                      placeholder: (_,url) => const Icon(Icons.image_rounded),
                                      errorWidget: (context, url, error) => const Icon(Icons.error),
                                    )),
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
                  }else{
                    return SliverList(delegate: SliverChildBuilderDelegate(
                      childCount: controller.photos.length,
                        (context, index){
                          final photo = controller.photos[index];
                          return Padding(
                              padding: const EdgeInsets.all(4),
                              child: Row(
                                children: [
                                  Image.network(
                                    photo.smallUrl,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              photo.photographer,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w800
                                            ),
                                          ),
                                          Text(
                                              photo.photographerUrl,
                                            style: const TextStyle(
                                              fontStyle: FontStyle.italic
                                            ),
                                          )
                                        ],
                                      )
                                  )
                                ],
                              ),
                          );
                        }
                    ));
                  }
                }
              ),

            ],
          ),
        )
    );
  }

}