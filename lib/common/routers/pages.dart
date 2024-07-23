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
  ];
}
