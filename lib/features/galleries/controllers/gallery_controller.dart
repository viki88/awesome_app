import 'package:awesome_app/core/constants/api_constant.dart';
import 'package:awesome_app/features/galleries/models/photo_model.dart';
import 'package:awesome_app/features/galleries/repositories/gallery_repository.dart';
import 'package:get/get.dart';

class GalleryController extends GetxController{

  final GalleryRepository galleryRepository = Get.put(GalleryRepository());

  @override
  void onInit() {
    super.onInit();
    fetchCuratedPhotos();
  }

  var photos = <PhotoModel>[].obs;
  var isLoading = false.obs;
  var error = ''.obs;
  var currentPage = 1.obs;

  Future<void> fetchCuratedPhotos() async {
    try{
      isLoading.value = true;
      // Get.dialog(
      //   const Center(child: CircularProgressIndicator()),
      //   barrierDismissible: false
      // );
      final fetchedPhotos = await galleryRepository.fetchCuratedPhotos(
          page: currentPage.value,
          perPage: ApiConstant.pexelDefaultPerPageCount
      );

      if(currentPage.value == 1){
        photos.value = fetchedPhotos;
      }else {
        photos.addAll(fetchedPhotos);
      }

      currentPage.value++;
      // if(Get.isDialogOpen == true) Get.back();
    } catch (e) {
      error.value = e.toString();
    } finally{
      isLoading.value = false;
      // Get.back();
    }
  }

  Future<void> refreshFetch() async{
    return fetchCuratedPhotos();
  }



}