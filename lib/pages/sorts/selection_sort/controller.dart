import 'package:get/get.dart';

class SelectionSortController extends GetxController {
  SelectionSortController();

  _initData() {
    update(["selection_sort"]);
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
