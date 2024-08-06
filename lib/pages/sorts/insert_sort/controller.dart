import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visible_algo_flutter/common/index.dart';


class MyInsertionNumber {
  int number;
  double left;
  bool isSwaping = false;
 // bool isSorted = false;
  MyInsertionNumber({required this.number, required this.left});
/*
  Color get bgColor {
    if ( isSwaping ) {
      return Colors.red;
    } else {
      if (isSorted) {
        return Colors.greenAccent;
      } else {
        return Colors.brown;
      }
    }
  } 
  */
}

class InsertSortController extends GetxController {

  var numbers = <MyInsertionNumber>[];
  var numberSize = 1.0;
  var swapDuration = Duration(seconds: 1);
  bool isRunning = false; // 是否在运行中

  InsertSortController();

  _initData() {
    _randomNumbers();
    update(["insert_sort"]);
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

  void onRandomNumberTapped() {
    _randomNumbers();
    update(["insert_sort"]);
  }

    // 生成随机数组
  void _randomNumbers() {
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
      numbers.add(MyInsertionNumber(number: randomNumber, left: left));
    }
  }

  // 排序
  Future<void> onSortTapped() async {
    if (isRunning) {
      return;
    }

    isRunning = true;

    for ( int iUnsorted = 0 ; iUnsorted < numbers.length; iUnsorted++ ) { // 未排序索引
      MyInsertionNumber temp = numbers[iUnsorted];
      // 找到并插入已序位置
      int iSort = iUnsorted - 1;
      while ( iSort >= 0 && temp.number < numbers[iSort].number ) {
        swap(index1: iSort, index2: iSort + 1);
        iSort--;
        await Future.delayed(const Duration(seconds: 1, milliseconds: 100));
      }
      //numbers[iUnsorted].isSorted = true; //设置为已序
    }



/*
    for (int i = 0; i < numbers.length ; i++) {
      for (int j = 0 ; j < numbers.length - i - 1; j++) {
        //Future.delayed(Duration.zero, () sync {
          swap(index1: j, index2: j+1);
          await Future.delayed(const Duration(seconds: 1, milliseconds: 100));
        //});
      }
    }
    */
    isRunning = false;
    update(["insert_sort"]);
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
      update(["insert_sort"]);
      Future.delayed(swapDuration).then((_) {
        MyInsertionNumber value = numbers[index1];
        numbers[index1] = numbers[index2];
        numbers[index2] = value;

        swapDuration = Duration.zero;
        numbers[index1].isSwaping = false;
        numbers[index2].isSwaping = false;
        update(["insert_sort"]);
      });
    } else {
      numbers[index1].isSwaping = true;
      numbers[index2].isSwaping = true;
      swapDuration = Duration(seconds: 1);
      update(["insert_sort"]);
      Future.delayed(swapDuration).then((_) {
        swapDuration = Duration.zero;
        numbers[index1].isSwaping = false;
        numbers[index2].isSwaping = false;
        update(["insert_sort"]);
      });
    }
  }

}
