import 'package:awesome_app/core/constants/api_constant.dart';
import 'package:awesome_app/features/galleries/models/photo_model.dart';
import 'package:awesome_app/features/galleries/repositories/gallery_repository.dart';
import 'package:get/get.dart';

class GalleryController extends GetxController{
  final GalleryRepository galleryRepository;

  GalleryController(this.galleryRepository);

  final RxList<PhotoModel> photos = <PhotoModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;
  final RxInt currentPage = 1.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCuratedPhotos();
  }

  Future<void> fetchCuratedPhotos() async {
    try{
      isLoading.value = true;

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
    } catch (e) {
      error.value = e.toString();
    } finally{
      isLoading.value = false;
    }
  }
}