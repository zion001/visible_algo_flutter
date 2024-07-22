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
    return (x - centerX) * (x - centerX) + (y - centerY) * (y - centerY) <= centerX * centerX;
  }
}

class MonteCarloPiController extends GetxController {
  // 画布Size
  double paintSize = Get.width - AppSpace.page * 2;

  // 随机生成的数据坐标
  List<MyPoint> listPoints = <MyPoint>[];

  // 总的随机个数
  var totalCount = 10000;

  // 圆内数量
  var inCnt = 0.obs;
  // 圆外数量
  var outCnt = 0.obs;
  // 近似Pi
  var estimatedPi = 0.0.obs;

  // 是否运行中
  var isRunning = false.obs;

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
    isRunning.value = !isRunning.value;

    // 重置数据
    if (isRunning.value) {
      listPoints.clear();
      inCnt.value = 0;
      outCnt.value = 0;
      estimatedPi.value = 0;
    }

    var random = Random();
    Future.delayed(Duration.zero, () async {
      for (int i = 0; i < totalCount; ++i) {
        double x = random.nextDouble() * paintSize;
        double y = random.nextDouble() * paintSize;
        MyPoint pt = MyPoint(x: x, y: y);
        listPoints.add( pt );
        if (pt.isIncluded()) {
          inCnt.value += 1;
        } else {
          outCnt.value += 1;
        }
        estimatedPi.value = 4 * inCnt.value / listPoints.length;

        if (listPoints.length < 100) {
          update(["monte_carlo_pi"]);
        } else if (listPoints.length >= 100 && listPoints.length < 1000 && listPoints.length % 5 == 0) {
            update(["monte_carlo_pi"]);
        }  else if (listPoints.length >= 1000 && listPoints.length < 5000 && listPoints.length % 20 == 0) {
            update(["monte_carlo_pi"]);
        } else if (listPoints.length >= 5000 && listPoints.length % 100 == 0) {
            update(["monte_carlo_pi"]);
        }
        

        await Future.delayed(const Duration(milliseconds: 20));

        if ( !isRunning.value ) {
          return;
        }
      }
      isRunning.value = false;
    });
  }
}
