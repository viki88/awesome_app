import 'package:get/get.dart';

class ToggleListController extends GetxController{
  final isGridView = true.obs;

  void toggleView(){
    isGridView.value = !isGridView.value;
  }
}