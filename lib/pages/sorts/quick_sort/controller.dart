import 'package:get/get.dart';

class QuickSortController extends GetxController {
  QuickSortController();

  _initData() {
    update(["quick_sort"]);
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
