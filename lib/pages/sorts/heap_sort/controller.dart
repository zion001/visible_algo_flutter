import 'package:get/get.dart';

class HeapSortController extends GetxController {
  HeapSortController();

  _initData() {
    update(["heap_sort"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
