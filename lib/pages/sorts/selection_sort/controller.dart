import 'dart:math';

import 'package:get/get.dart';
import 'package:visible_algo_flutter/common/index.dart';
import 'package:visible_algo_flutter/pages/sorts/bubble_sort/controller.dart';

class SelectionSortController extends GetxController {
  var numbers = <MyNumber>[];
  var numberSize = 1.0;
  var swapDuration = Duration(seconds: 1);
  bool isRunning = false; // 是否在运行中

  SelectionSortController();

  _initData() {
    randomNumbers();
    //update(["selection_sort"]);
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

  // 生成随机数组
  void randomNumbers() {
    if (isRunning) {
      return;
    }

    numbers.clear();
    int count = 8;
    numberSize = (Device().screenW -
            AppSpace.page * 2 -
            (count - 1) * AppSpace.listItem) /
        count;

    // 生成随机数组
    for (int i = 0; i < count; i++) {
      int randomNumber = Random().nextInt(50) + 1;
      double left = AppSpace.page + numberSize * i + AppSpace.listItem * i;
      numbers.add(MyNumber(number: randomNumber, left: left));
    }
    update(["selection_sort"]);
  }

  //排序
  Future<void> onSortTapped() async {
    if (isRunning) {
      return;
    }

    isRunning = true;
    for (int i = 0; i < numbers.length - 1; i++) {
      int minIndex = i;
      for (int j = i + 1; j < numbers.length; j++) {
        if (numbers[j].number < numbers[minIndex].number) {
          minIndex = j;
        }

        // swap(index1: j, index2: j + 1);
        // await Future.delayed(const Duration(seconds: 1, milliseconds: 100));
      }
      //update(["selection_sort"]);
      //await Future.delayed(const Duration(milliseconds: 1500));
      swap(index1: minIndex, index2: i);
      await Future.delayed(const Duration(seconds: 1, milliseconds: 600));
    }
    isRunning = false;
    update(["selection_sort"]);
  }

  // 交换指定的两个数字
  Future<void> swap({required int index1, required int index2}) async {
    if (index1 == index2) {
      numbers[index1].isSwaping = true;
      numbers[index2].isSwaping = true;
      swapDuration = Duration(seconds: 1, milliseconds: 500);
      update(["selection_sort"]);
      Future.delayed(swapDuration).then((_) {
        swapDuration = Duration.zero;
        numbers[index1].isSwaping = false;
        numbers[index2].isSwaping = false;
        update(["selection_sort"]);
      });
      return;
    }

    numbers[index1].isSwaping = true;
    numbers[index2].isSwaping = true;
    double temp = numbers[index1].left;
    numbers[index1].left = numbers[index2].left;
    numbers[index2].left = temp;
    swapDuration = Duration(seconds: 1, milliseconds: 500);
    update(["selection_sort"]);
    Future.delayed(swapDuration).then((_) {
      MyNumber value = numbers[index1];
      numbers[index1] = numbers[index2];
      numbers[index2] = value;

      swapDuration = Duration.zero;
      numbers[index1].isSwaping = false;
      numbers[index2].isSwaping = false;
      update(["selection_sort"]);
    });
  }
}
