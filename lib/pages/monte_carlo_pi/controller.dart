import 'dart:math';
import 'package:get/get.dart';
import 'package:visible_algo_flutter/common/index.dart';

class MyPoint {
  static var paintSize = Get.width - AppSpace.page * 2;
  var x = 0.0;
  var y = 0.0;
  MyPoint({required this.x, required this.y});

  bool isIncluded() {
    var centerX = paintSize / 2;
    var centerY = centerX;
    return (x - centerX) * (x - centerX) + (y - centerY) * (y - centerY) <
        centerX * centerX;
  }
}

class EstimatedPi {
  var pi = 0.0;
  var index = 0;
  EstimatedPi({required this.pi, required this.index});
}

class MonteCarloPiController extends GetxController {
  // 画布Size
  double paintSize = Get.width - AppSpace.page * 2;

  // 随机生成的数据坐标
  List<MyPoint> listPoints = <MyPoint>[];
  // 预估PI值，用于画图表
  List<EstimatedPi> listPi = <EstimatedPi>[];

  // 总的随机个数
  var totalCount = 10000;

  // 圆内数量
  var inCnt = 0;
  // 圆外数量
  var outCnt = 0;
  // 近似Pi
  var estimatedPi = 0.0;

  // 是否运行中
  var isRunning = false;

  MonteCarloPiController();

  _initData() {
    update(["monte_carlo_pi"]);
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

  //开始执行
  void onExecuteTapped() {
    isRunning = !isRunning;

    // 重置数据
    if (isRunning) {
      listPoints.clear();
      inCnt = 0;
      outCnt = 0;
      estimatedPi = 0;
      listPi.clear();
    }

    int indexPi = 0; // 用于标记Pi值的INDEX
    var random = Random();
    Future.delayed(Duration.zero, () async {
      for (int i = 0; i < totalCount; ++i) {
        double x = random.nextDouble() * paintSize;
        double y = random.nextDouble() * paintSize;
        MyPoint pt = MyPoint(x: x, y: y);
        listPoints.add(pt);
        if (pt.isIncluded()) {
          inCnt += 1;
        } else {
          outCnt += 1;
        }
        estimatedPi = 4 * inCnt / listPoints.length;

        // 每20个值，存一个PI值
        if (listPoints.length == 1 || listPoints.length % 20 == 0) {
          listPi.add( EstimatedPi(pi: estimatedPi, index: indexPi) );
          indexPi += 1;
        }

        update(["monte_carlo_pi"]);

        await Future.delayed(const Duration(milliseconds: 30));

        if (!isRunning) {
          return;
        }
      }
      isRunning = false;
    });
  }
}
