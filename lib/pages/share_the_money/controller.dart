import 'package:get/get.dart';

class ShareTheMoneyController extends GetxController {
  ShareTheMoneyController();

  _initData() {
    update(["share_the_money"]);
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
