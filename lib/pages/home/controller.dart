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
      subTitle: "利用大量数据模拟的方式，求出Pi的近似值。利用大量数据模拟在现实中用途相当广泛。",
      route: RouteNames.monteCarloPi,
    ),
    Item(
      title: "迷宫生成及寻路",
      subTitle: "包含一些常见的迷宫生成算法及寻路算法。",
      route: RouteNames.maze,
    ),
    Item(
      title: "冒泡排序",
      subTitle: "冒泡排序（Bubble Sort）是一种简单的排序算法，它通过多次遍历待排序的元素，比较相邻元素的大小，并交换它们直到整个序列有序。",
      route: RouteNames.sortsBubbleSort,
    ),
    Item(
      title: "选择排序",
      subTitle: "选择排序的基本思想是每次从待排序的列表中选择最小（或最大）的元素，将其与列表中的第一个位置交换，然后继续对剩余的元素进行排序，直到整个列表排序完成。",
      route: RouteNames.sortsSelectionSort,
    ),
    Item(
      title: "归并排序",
      subTitle: "一种简单的排序方法",
      route: RouteNames.sortsGuibingSort,
    ),
    Item(
      title: "堆排序",
      subTitle: "一种简单的排序方法",
      route: RouteNames.sortsHeapSort,
    ),
    Item(
      title: "插入排序",
      subTitle: "一种简单的排序方法",
      route: RouteNames.sortsInsertSort,
    ),
    Item(
      title: "快速排序",
      subTitle: "一种简单的排序方法",
      route: RouteNames.sortsQuickSort,
    ),
    Item(
      title: "两路归并排序",
      subTitle: "一种简单的排序方法",
      route: RouteNames.sortsTwoRoadsQuickSort,
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
