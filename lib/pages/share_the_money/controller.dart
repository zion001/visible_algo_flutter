import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:visible_algo_flutter/common/index.dart';
import 'package:visible_algo_flutter/pages/share_the_money/index.dart';
import 'dart:math' as math;

class MoneyData {
  MoneyData(this.index, this.money);
  int index;
  int money;
}

class ShareTheMoneyController extends GetxController {
  // 执行次数
  var countTextController = TextEditingController();
  var count = 1000; // 设置的执行次数

  // 当前执行的次数
  var curCount = 0.obs;

  var moneyList = List.generate(100, (index) {
    return MoneyData(index, 100);
  });

  // 执行倍数
  var speedList = [1, 5, 10, 50, 100];
  // 当前选中的倍数
  var curSpeed = 1.obs;

  // 允许负数
  var isAllowNegtive = false.obs;

  // 是否正在运行中
  var isRunning = false.obs;

  ShareTheMoneyController();

  _initData() {
    countTextController.text = '$count';
    update(["share_the_money"]);
  }

  void onTap() {}

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // 选择执行速度
  void setSpeed(int speed) {
    curSpeed.value = speed;
  }

  // 设置允许负数
  void onAllowNegtiveChange() {
    isAllowNegtive.value = !isAllowNegtive.value;
  }

  // 执行分钱过程
  void onExecuteTapped() {
    isRunning.value = !isRunning.value;

    if (isRunning.value) {
      bool isInt = int.tryParse(countTextController.text) != null;
      if (!isInt) {
        Loading.error('请输入正确的执行次数，要求为正整数。');
        isRunning.value = false;
        return;
      }
    }

    // 如果是运行，就重置数据
    //  if (isRunning.value) {
    moneyList = List.generate(100, (index) {
      return MoneyData(index, 100);
    });
    count = int.parse(countTextController.text);
    curCount.value = 0;
    //  }

    var random = math.Random();
    Future.delayed(Duration.zero, () async {
      for (curCount.value = 0; curCount.value < count; /*iCount++*/) {
        // 总次数
        for (int iSpeed = 0; iSpeed < curSpeed.value; iSpeed++) {
          // 速度倍率
          for (int iPerson = 0; iPerson < 100; iPerson++) {
            if (!isAllowNegtive.value && moneyList[iPerson].money <= 0) {
              // 不允许负数
              continue;
            }
            int iDest = random.nextInt(100);
            moneyList[iPerson].money -= 1;
            moneyList[iDest].money += 1;
            if (!isRunning.value) {
              return;
            }
          }
          curCount.value += 1;
          // iCount += 1;
        }
        update(["share_the_money"]);
        //curCount += 1;
        await Future.delayed(const Duration(milliseconds: 20));
      }
      isRunning.value = false;
    });
  }
}
