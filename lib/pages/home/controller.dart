import 'package:get/get.dart';
import 'package:visible_algo_flutter/common/routers/index.dart';

class Item {
  final String title;
  final String subTitle;
  final String route;

  Item({
    required this.title,
    required this.subTitle,
    required this.route,
  });
}

class HomeController extends GetxController {
  var items = [
    Item(
      title: "模拟分钱",
      subTitle:
          "房间里有 100 个人，每人都有 100 元钱，他们在玩一个游戏。每轮游戏中，每个人都要拿出一元钱随机给另一个人，最后这 100 个人的财富分布是怎样的？",
      route: RouteNames.shareTheMoney,
    ),
    Item(
      title: "模拟分钱",
      subTitle:
          "房间里有 100 个人，每人都有 100 元钱，他们在玩一个游戏。每轮游戏中，每个人都要拿出一元钱随机给另一个人，最后这 100 个人的财富分布是怎样的？",
      route: RouteNames.shareTheMoney,
    ),
  ];

  HomeController();

  _initData() {
    update(["home"]);
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

  // 列表被点击
  void onListItemTapped(String route) {
    Get.toNamed(route);
  }
}
