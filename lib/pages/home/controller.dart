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
          "房间里有 100 个人，每人都有 100 元钱，他们在玩一个游戏。每轮游戏中，每个人都要拿出一元钱随机给另一个人，经过若干轮后，这 100 个人的财富分布是怎样的？",
      route: RouteNames.shareTheMoney,
    ),
    Item(
      title: "蒙特卡洛估算Pi值",
      subTitle:
          "利用大量数据模拟的方式，求出Pi的近似值。利用大量数据模拟在现实中用途相当广泛。",
      route: RouteNames.monteCarloPi,
    ),
    Item(
      title: "迷宫生成及寻路",
      subTitle:
          "包含一些常见的迷宫生成算法及寻路算法。",
      route: RouteNames.maze,
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
