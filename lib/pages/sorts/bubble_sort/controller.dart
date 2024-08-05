import 'dart:math';
//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:get/get.dart';
import 'package:visible_algo_flutter/common/index.dart';

class MyNumber {
  int number;
  double left;
  bool isSwaping = false;
  MyNumber({required this.number, required this.left});
}

class BubbleSortController extends GetxController {
  var numbers = <MyNumber>[];
  var numberSize = 1.0;
  var swapDuration = Duration(seconds: 1);
  bool isRunning = false; // 是否在运行中

  BubbleSortController();

  _initData() {
    randomNumbers();

    update(["bubble_sort"]);
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
     update(["bubble_sort"]);
  }

  // 排序
  Future<void> onSortTapped() async {
    if (isRunning) {
      return;
    }

    isRunning = true;
    for (int i = 0; i < numbers.length ; i++) {
      for (int j = 0 ; j < numbers.length - i - 1; j++) {
        //Future.delayed(Duration.zero, () sync {
          swap(index1: j, index2: j+1);
          await Future.delayed(const Duration(seconds: 1, milliseconds: 100));
        //});
      }
    }
    isRunning = false;
    update(["bubble_sort"]);
  }

  // 交换指定的两个数字
  void swap({required int index1, required int index2}) {
    if (index1 == index2) {
      return;
    }

    if (numbers[index1].number > numbers[index2].number) {
      numbers[index1].isSwaping = true;
      numbers[index2].isSwaping = true;
      double temp = numbers[index1].left;
      numbers[index1].left = numbers[index2].left;
      numbers[index2].left = temp;
      swapDuration = Duration(seconds: 1);
      update(["bubble_sort"]);
      Future.delayed(swapDuration).then((_) {
        MyNumber value = numbers[index1];
        numbers[index1] = numbers[index2];
        numbers[index2] = value;

        swapDuration = Duration.zero;
        numbers[index1].isSwaping = false;
        numbers[index2].isSwaping = false;
        update(["bubble_sort"]);
      });
    } else {
      numbers[index1].isSwaping = true;
      numbers[index2].isSwaping = true;
      swapDuration = Duration(seconds: 1);
      update(["bubble_sort"]);
      Future.delayed(swapDuration).then((_) {
        swapDuration = Duration.zero;
        numbers[index1].isSwaping = false;
        numbers[index2].isSwaping = false;
        update(["bubble_sort"]);
      });
    }
  }
}
