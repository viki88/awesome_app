import 'package:awesome_app/features/galleries/models/photo_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailGalleryPage extends StatelessWidget{

  final PhotoModel photoModel;

  const DetailGalleryPage({super.key, required this.photoModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: (){
              Get.back();
            },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Hero(
                tag: 'gallery_tag',
                child: CachedNetworkImage(
                  imageUrl: photoModel.originalUrl,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  placeholder: (context,url) => const SizedBox(
                    height: 400,
                    child: Icon(Icons.image),
                  ),
                  errorWidget: (context,url,error) => const Icon(Icons.error),
                )
            ),
            const SizedBox(height: 24),
            Text(
              photoModel.photographer,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 26
              ),
            ),
            const SizedBox(height: 8),
            Visibility(
                visible: photoModel.alt.isNotEmpty,
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          photoModel.alt,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                )
            ),
            Text(
              photoModel.photographerUrl,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontStyle: FontStyle.italic
              ),
            )
          ],
        ),
      ),
    );
  }

}