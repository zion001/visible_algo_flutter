import 'package:get/get.dart';
import 'package:visible_algo_flutter/pages/index.dart';
import 'names.dart';

class RoutePages {
  // 列表
  static List<GetPage> list = [
    GetPage(
        name: RouteNames.home,
        page: () => const HomePage(),
      ),
            GetPage(
        name: RouteNames.maze,
        page: () => const MazePage(),
      ),
      GetPage(
        name: RouteNames.monteCarloPi,
        page: () => const MonteCarloPiPage(),
      ),
      GetPage(
        name: RouteNames.shareTheMoney,
        page: () => const ShareTheMoneyPage(),
      ),
      GetPage(
        name: RouteNames.sortsBubbleSort,
        page: () => const BubbleSortPage(),
      ),
      GetPage(
        name: RouteNames.sortsGuibingSort,
        page: () => const GuibingSortPage(),
      ),
      GetPage(
        name: RouteNames.sortsHeapSort,
        page: () => const HeapSortPage(),
      ),
      GetPage(
        name: RouteNames.sortsInsertSort,
        page: () => const InsertSortPage(),
      ),
      GetPage(
        name: RouteNames.sortsQuickSort,
        page: () => const QuickSortPage(),
      ),
      GetPage(
        name: RouteNames.sortsSelectionSort,
        page: () => const SelectionSortPage(),
      ),
      GetPage(
        name: RouteNames.sortsTwoRoadsQuickSort,
        page: () => const TwoRoadsQuickSortPage(),
      ),
      GetPage(
        name: RouteNames.systemAbout,
        page: () => const AboutPage(),
      ),
  ];
}
